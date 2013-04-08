//
//  JDGAppDelegate.m
//  Strategy
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGAppDelegate.h"
#include "Context.h"
#include "Strategy.h"

@implementation JDGAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    Strategy* ps = new ConcreteStrategyA();
    Context* pc = new Context(ps);
    pc->DoAction();
    if (NULL != pc)
        delete pc;
    return YES;
}
							
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    NSString *str = [NSString stringWithFormat:@"%@",url];
    [[[[UIAlertView alloc]initWithTitle:str message:nil delegate:nil cancelButtonTitle:@"恩" otherButtonTitles:nil] autorelease] show];
    return YES;
}

@end
