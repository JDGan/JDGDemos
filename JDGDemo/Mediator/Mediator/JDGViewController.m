//
//  JDGViewController.m
//  Mediator
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGViewController.h"

@interface JDGViewController ()

@end

@implementation JDGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backPressed:(id)sender
{
    NSURL *url  = [NSURL URLWithString:@"DemoCenter:"];
    
    [[UIApplication sharedApplication] openURL:url];
}

@end
