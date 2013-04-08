//
//  JDGAppDelegate.m
//  ChainOfResponsibility
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGAppDelegate.h"
#include "Handle.h"

@implementation JDGAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    ChainHandle* h1 = new ConcreteHandleA();
    ChainHandle* h2 = new ConcreteHandleB();
    h1->SetSuccessor(h2);
    h1->HandleRequest();
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    NSString *str = [NSString stringWithFormat:@"%@",url];
    [[[[UIAlertView alloc]initWithTitle:str message:nil delegate:nil cancelButtonTitle:@"恩" otherButtonTitles:nil] autorelease] show];
    return YES;
}


@end
