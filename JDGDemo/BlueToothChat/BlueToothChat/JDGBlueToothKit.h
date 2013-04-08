//
//  JDGBlueToothKit.h
//  BlueToothChat
//
//  Created by Gan LL on 13-3-27.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    JDGBlueToothTypeTexts,
    JDGBlueToothTypeSounds,
    JDGBlueToothTypeImages,
}JDGBlueToothType;

@protocol JDGBlueToothKitDelegate;

@interface JDGBlueToothKit : NSObject

@property (nonatomic ,assign) id <JDGBlueToothKitDelegate> delegate;

- (void)tryToConnectWithType:(JDGBlueToothType)type;

- (void)dismiss;

- (void)disconnect;

- (void)sendData:(NSData *)data;

+ (JDGBlueToothKit *)sharedInstance;

@end


@protocol JDGBlueToothKitDelegate <NSObject>

@optional

- (void)blueToothDidConnect:(JDGBlueToothType)type;

- (void)blueToothDidNotConnect:(JDGBlueToothType)type;

- (void)didReceiveData:(NSData *)data fromPeer:(NSString *)peerID;

@end