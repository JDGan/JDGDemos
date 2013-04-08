//
//  JDGViewController.m
//  VoiceRecognition
//
//  Created by Gan LL on 13-4-7.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGViewController.h"
#import <iflyMSC/IFlyRecognizeControl.h>

// 控件的位置
#define H_CONTROL_ORIGIN CGPointMake(20, 70)
// 此 appid 为您所申请,请勿随意修改
#define APPID @"515b8575"
#define ENGINE_URL @"http://dev.voicecloud.cn:1028/index.htm"

@interface JDGViewController () <IFlyRecognizeControlDelegate>
{
    IFlyRecognizeControl *_iFlyRecognizeControl;
}
@end

@implementation JDGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _recoLabel.numberOfLines = 0;
    _recoLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
	// Do any additional setup after loading the view, typically from a nib.
    NSString*initParam=[[NSString alloc]initWithFormat:@"server_url=%@,appid=%@",ENGINE_URL,APPID];
    // 初始化语音识别控件
    _iFlyRecognizeControl=[[IFlyRecognizeControl alloc]initWithOrigin:H_CONTROL_ORIGIN
                                                            initParam:initParam];
    [self.view addSubview:_iFlyRecognizeControl];
    // 设置语音识别控件的参数,具体参数可参看开发文档
    [_iFlyRecognizeControl setEngine:@"sms" engineParam:nil grammarID:nil];
    [_iFlyRecognizeControl setSampleRate:16000];
    _iFlyRecognizeControl.delegate = self;
    // 实现控件的回调函数
}

/*
 @function	onResult
 @abstract	回调返回识别结果
 @discussion
 @param     resultArray - 返回的识别结果，为一个数组，数组中存放的为字典，key值"NAME"对应的为返回结果
 */
- (void)onResult:(IFlyRecognizeControl *)iFlyRecognizeControl theResult:(NSArray *)resultArray
{
    NSMutableString *str = [NSMutableString stringWithString:@""];
    for (NSDictionary *resultDic in resultArray)
    {
        NSString *name = [resultDic objectForKey:@"NAME"];
        [str appendFormat:@"%@\n",name];
    }
    _recoLabel.text = str;
    [_recoLabel sizeThatFits:CGSizeMake(300, MAXFLOAT)];
    NSLog(@"%@",resultArray);
}

/*
 @function	onRecognizeEnd
 @abstract	识别结束回调
 @discussion
 @param
 */
- (void)onRecognizeEnd:(IFlyRecognizeControl *)iFlyRecognizeControl theError:(SpeechError) error
{
    NSLog(@"%d",error);
}

- (IBAction)click:(id)sender
{
    [_iFlyRecognizeControl start];
}
- (void)dealloc {
    [_recoLabel release];
    [super dealloc];
}


- (IBAction)backPressed:(id)sender
{
    NSURL *url  = [NSURL URLWithString:@"DemoCenter:"];
    
    [[UIApplication sharedApplication] openURL:url];
}

@end
