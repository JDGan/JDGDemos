//
//  JDGBlueToothKit.m
//  BlueToothChat
//
//  Created by Gan LL on 13-3-27.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGBlueToothKit.h"
#import <GameKit/GameKit.h>

@interface JDGBlueToothKit()
<GKPeerPickerControllerDelegate>
{
    GKPeerPickerController *_defaultController;
    GKSession *_session;
    JDGBlueToothType _type;
}

@end


@implementation JDGBlueToothKit

static JDGBlueToothKit *_kit = nil;

+ (JDGBlueToothKit *)sharedInstance
{
    if (_kit == nil)
    {
        _kit = [[JDGBlueToothKit alloc] init];
    }
    return _kit;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        
        _defaultController = [[GKPeerPickerController alloc] init];
        _defaultController.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
        _defaultController.delegate = self;
        
        NSString *sessionID = @"JDGBlueToothChat";
        NSString *displayName = [[UIDevice currentDevice] name];
        _session = [[GKSession alloc] initWithSessionID:sessionID displayName:displayName sessionMode:GKSessionModePeer];
        [_session setDataReceiveHandler:self withContext:NULL];
        
        _type = JDGBlueToothTypeTexts;
    }
    return self;
}

- (void)tryToConnectWithType:(JDGBlueToothType)type
{
    _type = type;
    [_defaultController show];
}

- (void)dismiss
{
    [_defaultController dismiss];    
}

- (void)disconnect
{
    [_session disconnectFromAllPeers];
}

- (void)sendData:(NSData *)data toPeers:(NSArray *)peers
{
    [_session sendData:data toPeers:nil withDataMode:GKSendDataUnreliable error:nil];
}

- (void)sendData:(NSData *)data
{
    [_session sendDataToAllPeers:data withDataMode:GKSendDataUnreliable error:nil];
}

- (void)receiveData:(NSData *)data fromPeer:(NSString *)peerID inSession:(GKSession *)session context:(void *)context
{
    if ([self.delegate respondsToSelector:@selector(didReceiveData:fromPeer:)])
    {
        [self.delegate didReceiveData:data fromPeer:peerID];
    }
}

/* Notifies delegate that a connection type was chosen by the user.
 */
- (void)peerPickerController:(GKPeerPickerController *)picker didSelectConnectionType:(GKPeerPickerConnectionType)type
{
    
}

/* Notifies delegate that the connection type is requesting a GKSession object.
 
 You should return a valid GKSession object for use by the picker. If this method is not implemented or returns 'nil', a default GKSession is created on the delegate's behalf.
 */
- (GKSession *)peerPickerController:(GKPeerPickerController *)picker sessionForConnectionType:(GKPeerPickerConnectionType)type
{
    if (type == GKPeerPickerConnectionTypeNearby)
    {
        return _session;
    }
    return nil;
}

/* Notifies delegate that the peer was connected to a GKSession.
 */
- (void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session
{
    [self dismiss];
    if ([self.delegate respondsToSelector:@selector(blueToothDidConnect:)])
    {
        [self.delegate blueToothDidConnect:_type];
    }

}

/* Notifies delegate that the user cancelled the picker.
 */
- (void)peerPickerControllerDidCancel:(GKPeerPickerController *)picker
{
    [self dismiss];    
    if ([self.delegate respondsToSelector:@selector(blueToothDidNotConnect:)])
    {
        [self.delegate blueToothDidNotConnect:_type];
    }
}

@end
