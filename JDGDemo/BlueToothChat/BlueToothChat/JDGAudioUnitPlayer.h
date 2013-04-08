//
//  JDGAudioUnitPlayer.h
//  BlueToothChat
//
//  Created by Gan LL on 13-4-3.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum
{
    JDGAudioUnitPlayerFile      = (1 << 0),      //0x1
    JDGAudioUnitPlayerUrl       = (1 << 1),      //0x2
    JDGAudioUnitPlayerStream    = (1 << 2)       //0x4
}JDGAudioUnitPlayerType;

@interface JDGAudioUnitPlayer : NSObject

@property (nonatomic ,readonly) JDGAudioUnitPlayerType type;

+ (JDGAudioUnitPlayer *)defaultPlayer;

- (void)setFile:(NSString *)filePath;

- (void)setUrl:(NSURL *)audioUrl;

- (void)fillStreamData:(NSData *)data;

- (OSStatus)play;

- (OSStatus)stop;

@end