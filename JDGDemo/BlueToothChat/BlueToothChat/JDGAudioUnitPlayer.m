//
//  JDGAudioUnitPlayer.m
//  BlueToothChat
//
//  Created by Gan LL on 13-4-3.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGAudioUnitPlayer.h"
#import <AudioToolbox/AudioToolbox.h>
#define kOutputBus 0
#define kInputBus 1

@implementation JDGAudioUnitPlayer
{
    AudioComponentInstance _audioComIn;
    AudioStreamBasicDescription _audioBasDesc;
    
    NSMutableArray *_audioData;
}
@synthesize type = _type;

static JDGAudioUnitPlayer *_defaultPlayer = nil;

+ (JDGAudioUnitPlayer *)defaultPlayer
{
    if (_defaultPlayer == nil)
    {
        _defaultPlayer = [[JDGAudioUnitPlayer alloc] init];
    }
    return _defaultPlayer;
}

-(OSStatus)play{
	
	OSStatus status = AudioOutputUnitStart(_audioComIn);
	return status;
}

-(OSStatus)stop{
	OSStatus status = AudioOutputUnitStop(_audioComIn);
	return status;
}

-(void)cleanUp{
	AudioUnitUninitialize(_audioComIn);
}

- (void)setUrl:(NSURL *)audioUrl
{
    _type = JDGAudioUnitPlayerUrl;
    /*
     todo: 木有实现
     */
}

- (void)setFile:(NSString *)filePath
{
    _type = JDGAudioUnitPlayerFile;
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    [_audioData addObject:data];
    /*
     todo: 木有实现
     */
}

- (void)fillStreamData:(NSData *)data
{
    _type = JDGAudioUnitPlayerStream;
    [_audioData insertObject:data atIndex:0];
    NSLog(@"insert Succeed");
    /*
     todo: 木有实现
     */
}

static UInt32 counter = 0;

- (UInt32)getNextPacket
{
    NSData *data = [_audioData lastObject];
    if (data == nil)
    {
        NSLog(@"NO packet found");
        return 0;
    }
    if (counter < [data length])
    {
        const UInt32 * a = [data bytes];
        UInt32 b = a[counter++];
//        NSLog(@"packet got");
        return b;
    }
    else
    {
        [_audioData removeObject:data];
        counter = 0;
        return [self getNextPacket];
    }
}

/* Parameters on entry to this function are :-
 
 *inRefCon - used to store whatever you want, can use it to pass in a reference to an objectiveC class
 i do this below to get at the InMemoryAudioFile object, the line below :
 callbackStruct.inputProcRefCon = self;
 in the initialiseAudio method sets this to "self" (i.e. this instantiation of RemoteIOPlayer).
 This is a way to bridge between objectiveC and the straight C callback mechanism, another way
 would be to use an "evil" global variable by just specifying one in theis file and setting it
 to point to inMemoryAudiofile whenever it is set.
 
 *inTimeStamp - the sample time stamp, can use it to find out sample time (the sound card time), or the host time
 
 inBusnumber - the audio bus number, we are only using 1 so it is always 0
 
 inNumberFrames - the number of frames we need to fill. In this example, because of the way audioformat is
 initialised below, a frame is a 32 bit number, comprised of two signed 16 bit samples.
 
 *ioData - holds information about the number of audio buffers we need to fill as well as the audio buffers themselves */
static OSStatus sourceInputProc(void *inRefCon,
								 AudioUnitRenderActionFlags *ioActionFlags,
								 const AudioTimeStamp *inTimeStamp,
								 UInt32 inBusNumber,
								 UInt32 inNumberFrames,
								 AudioBufferList *ioData) {
	
    UInt32 *frameBuffer = NULL;
    AudioBuffer buffer;
	
	//get a copy of the objectiveC class "self" we need this to get the next sample to fill the buffer
    JDGAudioUnitPlayer *player = (JDGAudioUnitPlayer *)inRefCon;
    
    switch (player.type)
    {
        case JDGAudioUnitPlayerFile:
        {
            //loop through all the buffers that need to be filled
            for (int i = 0 ; i < ioData->mNumberBuffers; i++)
            {
                //get the buffer to be filled
                buffer = ioData->mBuffers[i];
                
                //if needed we can get the number of bytes that will fill the buffer using
                // int numberOfSamples = ioData->mBuffers[i].mDataByteSize;
                
                //get the buffer and point to it as an UInt32 (as we will be filling it with 32 bit samples)
                //if we wanted we could grab it as a 16 bit and put in the samples for left and right seperately
                //but the loop below would be for(j = 0; j < inNumberFrames * 2; j++) as each frame is a 32 bit number
                frameBuffer = buffer.mData;
                
                //loop through the buffer and fill the frames
                for (int j = 0; j < inNumberFrames; j++)
                {
                    // get NextPacket returns a 32 bit value, one frame.
                    frameBuffer[j] = [[JDGAudioUnitPlayer defaultPlayer] getNextPacket];
                }
            }
        }
            break;
        case JDGAudioUnitPlayerStream:
        {
            //loop through all the buffers that need to be filled
            for (int i = 0 ; i < ioData->mNumberBuffers; i++){
                //get the buffer to be filled
                buffer = ioData->mBuffers[i];
                
                //if needed we can get the number of bytes that will fill the buffer using
                // int numberOfSamples = ioData->mBuffers[i].mDataByteSize;
                
                //get the buffer and point to it as an UInt32 (as we will be filling it with 32 bit samples)
                //if we wanted we could grab it as a 16 bit and put in the samples for left and right seperately
                //but the loop below would be for(j = 0; j < inNumberFrames * 2; j++) as each frame is a 32 bit number
                frameBuffer = buffer.mData;
                
                //loop through the buffer and fill the frames
                for (int j = 0; j < inNumberFrames; j++)
                {
                    // get NextPacket returns a 32 bit value, one frame.
                    frameBuffer[j] = [[JDGAudioUnitPlayer defaultPlayer] getNextPacket];
                }
            }
        }
            break;
            
        default:
            break;
    }
	
//	//loop through all the buffers that need to be filled
//	for (int i = 0 ; i < ioData->mNumberBuffers; i++){
//		//get the buffer to be filled
//		buffer = ioData->mBuffers[i];
//		
//		//if needed we can get the number of bytes that will fill the buffer using
//		// int numberOfSamples = ioData->mBuffers[i].mDataByteSize;
//		
//		//get the buffer and point to it as an UInt32 (as we will be filling it with 32 bit samples)
//		//if we wanted we could grab it as a 16 bit and put in the samples for left and right seperately
//		//but the loop below would be for(j = 0; j < inNumberFrames * 2; j++) as each frame is a 32 bit number
//		frameBuffer = buffer.mData;
//		
//		//loop through the buffer and fill the frames
//		for (int j = 0; j < inNumberFrames; j++){
//			// get NextPacket returns a 32 bit value, one frame.
//			frameBuffer[j] = 0;//[[remoteIOplayer inMemoryAudioFile] getNextPacket];
//		}
//	}
	//dodgy return :)
    return noErr;
}



- (id)init
{
    self = [super init];
    if (self)
    {
        _audioData = [[NSMutableArray alloc] init];
        
        OSStatus status;
        
        // Describe audio component
        AudioComponentDescription       desc;
        desc.componentType              = kAudioUnitType_Output;
        desc.componentSubType           = kAudioUnitSubType_RemoteIO;
        desc.componentFlags             = 0;
        desc.componentFlagsMask         = 0;
        desc.componentManufacturer      = kAudioUnitManufacturer_Apple;
        
        // Get component
        AudioComponent inputComponent   = AudioComponentFindNext(NULL, &desc);
        
        // Get audio units
        status = AudioComponentInstanceNew(inputComponent, &_audioComIn);
        
        UInt32 flag                     = 1;
        // Enable IO for playback
        status = AudioUnitSetProperty(_audioComIn,
                                      kAudioOutputUnitProperty_EnableIO,
                                      kAudioUnitScope_Output,
                                      kOutputBus,
                                      &flag,
                                      sizeof(flag));
        
        // Describe format
        _audioBasDesc.mSampleRate			= 44100.00;
        _audioBasDesc.mFormatID             = kAudioFormatLinearPCM;
        _audioBasDesc.mFormatFlags          = kAudioFormatFlagIsSignedInteger | kAudioFormatFlagIsPacked;
        _audioBasDesc.mFramesPerPacket      = 1;
        _audioBasDesc.mChannelsPerFrame     = 2;
        _audioBasDesc.mBitsPerChannel		= 16;
        _audioBasDesc.mBytesPerPacket		= 4;
        _audioBasDesc.mBytesPerFrame		= 4;
        
        //Apply format
        status = AudioUnitSetProperty(_audioComIn,
                                      kAudioUnitProperty_StreamFormat,
                                      kAudioUnitScope_Input,
                                      kOutputBus,
                                      &_audioBasDesc,
                                      sizeof(_audioBasDesc));
        
        // Set up the playback  callback
        AURenderCallbackStruct callbackStruct;
        callbackStruct.inputProc = sourceInputProc;
        //set the reference to "self" this becomes *inRefCon in the playback callback
        callbackStruct.inputProcRefCon = self;
        
        status = AudioUnitSetProperty(_audioComIn, 
                                      kAudioUnitProperty_SetRenderCallback, 
                                      kAudioUnitScope_Global, 
                                      kOutputBus,
                                      &callbackStruct, 
                                      sizeof(callbackStruct));
        
        // Initialise
        status = AudioUnitInitialize(_audioComIn);
        
        //notice i do nothing with status, i should error check.

    }
    return self;
}

@end
