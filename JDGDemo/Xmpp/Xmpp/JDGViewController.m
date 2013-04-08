//
//  JDGViewController.m
//  Xmpp
//
//  Created by Gan LL on 13-4-7.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGViewController.h"

#import "JDGXMPPCenter.h"

@interface JDGViewController ()
{
    JDGXMPPCenter * center;
}
@end

@implementation JDGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    center = [[JDGXMPPCenter alloc] init];
    [center setupStream];
    [center connect];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendPressed:(id)sender
{
    [center sendMessage:@"我测试一下"];
}

- (IBAction)backPressed:(id)sender
{
    NSURL *url  = [NSURL URLWithString:@"DemoCenter:"];
    
    [[UIApplication sharedApplication] openURL:url];
}

@end
