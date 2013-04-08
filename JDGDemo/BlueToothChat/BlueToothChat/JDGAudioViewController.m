//
//  JDGAudioViewController.m
//  BlueToothChat
//
//  Created by Gan LL on 13-4-1.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGAudioViewController.h"
#import "JDGBlueToothKit.h"
#import "JDGAudioUnitPlayer.h"
#import <AVFoundation/AVFoundation.h>


@interface JDGAudioViewController ()
<JDGBlueToothKitDelegate,AVCaptureAudioDataOutputSampleBufferDelegate>
{
    AVCaptureSession *_session;
    dispatch_queue_t _captureQueue;
}

@end

@implementation JDGAudioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[JDGBlueToothKit sharedInstance] setDelegate:self];

//    NSString *path = [[NSBundle mainBundle] pathForResource:@"funkBeats" ofType:@"wav"];
//    [[JDGAudioUnitPlayer defaultPlayer] setFile:path];
//    [[JDGAudioUnitPlayer defaultPlayer] play];

    _captureQueue = dispatch_queue_create("Capture", NULL);
    [self setupCaptureSession];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupCaptureSession
{
    NSError *error = nil;
    
    // Create the session
    _session = [[AVCaptureSession alloc] init];
    
    // Configure the session to produce lower resolution video frames, if your
    // processing algorithm can cope. We'll specify medium quality for the
    // chosen device.
    _session.sessionPreset = AVCaptureSessionPresetLow;
    
    // Find a suitable AVCaptureDevice
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
    
    // Create a device input with the device and add it to the session.
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device
                                                                        error:&error];
    if (!input) {
        // Handling the error appropriately.
        NSLog(@"Input error");
    }
    [_session addInput:input];
    
    // Create a VideoDataOutput and add it to the session
    AVCaptureAudioDataOutput *output = [[[AVCaptureAudioDataOutput alloc] init] autorelease];
    [_session addOutput:output];
    
    // Configure your output.
    dispatch_queue_t queue = dispatch_queue_create("myQueue", NULL);
    [output setSampleBufferDelegate:self queue:queue];
    dispatch_release(queue);
    
    // Specify the pixel format
//    output.
   
    [output connectionWithMediaType:AVMediaTypeAudio];
    
    // If you wish to cap the frame rate to a known value, such as 15 fps, set
    // minFrameDuration.
    //    output.minFrameDuration = CMTimeMake(1, 15);
    
    // Start the session running to start the flow of data
    [_session startRunning];
    
    // Assign session to an ivar.
    //    [self setSession:session];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection
{
    
    UInt64 total_converted_bytes;
    UInt64 converted_count = 0;
    UInt64 converted_sample_num;
    size_t sample_size;
    short* data_buffer = nil;
    CMBlockBufferRef next_buffer_data=nil;
    
    CMSampleBufferRef next_buffer=sampleBuffer;
    if (next_buffer)
    {
        
        total_converted_bytes       =       CMSampleBufferGetTotalSampleSize(next_buffer);//next_buffer的总字节数；
        sample_size                 =       CMSampleBufferGetSampleSize(next_buffer, 0);//next_buffer中序号为0的sample的大小；
        converted_sample_num        =       CMSampleBufferGetNumSamples(next_buffer);//next_buffer中所含sample的总个数；
        
//        NSLog(@"the number of samples is %f",(float)converted_sample_num);
//        NSLog(@"the size of the sample is %f",(float)sample_size);
//        NSLog(@"the size of the whole buffer is %f",(float)total_converted_bytes);
        
        //copy the data to the data_buffer varible;
        //这种方法中，我们每获得一次nextSampleBuffer后就对其进行解析，而不是把文件全部载入内存后再进行解析；
        //AVAssetReaderOutput 的copyNextSampleBuffer方法每次读取8196个sample的数据(最后一次除外)，这些数据是以short型存放在内存中(两字节为一单元)
        //每个sample的大小和音频的声道数相关，可以用CMSampleBufferGetSampleSize来获得，所以每次调用copyNextSampleBuffer后所获得的数据大小为8196*sample_size(byte);
        //据此，我们申请data_buffer时每次需要的空间也是固定的，为(8196*sample_size)/2个short型内存(每个short占两字节);
        if (!data_buffer)
        {
            data_buffer= new short[total_converted_bytes];
        }
        next_buffer_data=CMSampleBufferGetDataBuffer(next_buffer);
        OSStatus buffer_status=CMBlockBufferCopyDataBytes(next_buffer_data, 0, total_converted_bytes, data_buffer);
        if (buffer_status!=kCMBlockBufferNoErr)
        {
            NSLog(@"something wrong happened when copying data bytes");
            return;
        }
        
        /*
         此时音频的数据存储在data_buffer中，这些数据是音频原始数据（未经任何压缩），可以对其进行解析或其它操作
         */
        NSData *data = [NSData dataWithBytes:data_buffer length:total_converted_bytes];
        dispatch_async(_captureQueue, ^{
            [[JDGAudioUnitPlayer defaultPlayer] fillStreamData:data];
        });

    }
    else
    {
        NSLog(@"total sameple size %lld", converted_count);
    }
}

- (void)didReceiveData:(NSData *)data fromPeer:(NSString *)peerID
{
    
}

- (void)dealloc {
    CFRelease(_captureQueue);
    [_session stopRunning];
    [_session release];
    [super dealloc];
}


- (IBAction)pressToSpeak:(id)sender
{
    [[JDGAudioUnitPlayer defaultPlayer] play];
}
@end
