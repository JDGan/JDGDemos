//
//  JDGViewController.m
//  BlueToothChat
//
//  Created by Gan LL on 13-3-27.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGViewController.h"
#import "JDGBlueToothKit.h"

@interface JDGViewController ()
<JDGBlueToothKitDelegate>

@end

@implementation JDGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (IBAction)startPressed:(id)sender
{
    JDGBlueToothKit *kit = [JDGBlueToothKit sharedInstance];
    kit.delegate = self;
    [kit tryToConnectWithType:JDGBlueToothTypeTexts];
}

- (void)videoPressed:(id)sender
{
    JDGBlueToothKit *kit = [JDGBlueToothKit sharedInstance];
    kit.delegate = self;
    [kit tryToConnectWithType:JDGBlueToothTypeImages];
}

- (void)audioPressed:(id)sender
{
    [self performSegueWithIdentifier:@"AudioMatchAndPush" sender:self];
//    JDGBlueToothKit *kit = [JDGBlueToothKit sharedInstance];
//    kit.delegate = self;
//    [kit tryToConnectWithType:JDGBlueToothTypeSounds];
}

- (void)blueToothDidConnect:(JDGBlueToothType)type
{
    NSString *identify = nil;
    switch (type)
    {
        case JDGBlueToothTypeTexts:
            identify = @"ChatMatchAndPush";
            break;
        case JDGBlueToothTypeSounds:
            identify = @"AudioMatchAndPush";
            break;
        case JDGBlueToothTypeImages:
            identify = @"VideoMatchAndPush";
            break;
        default:
            break;
    }
    [self performSegueWithIdentifier:identify sender:self];
}

- (IBAction)backPressed:(id)sender
{
    NSURL *url  = [NSURL URLWithString:@"DemoCenter:"];
    
    [[UIApplication sharedApplication] openURL:url];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
