//
//  JDGAppDelegate.m
//  Memento
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGAppDelegate.h"
#include "Memento.h"

@implementation JDGAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    Originator* o = new Originator();
    o->SetState("old"); //备忘前状态
    o->PrintState();
    Memento* m = o->CreateMemento(); //将状态备忘
    o->SetState("new"); //修改状态
    o->PrintState();
    o->RestoreToMemento(m); //恢复修改前状态
    o->PrintState();
    
    return YES;
}
							
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    NSString *str = [NSString stringWithFormat:@"%@",url];
    [[[[UIAlertView alloc]initWithTitle:str message:nil delegate:nil cancelButtonTitle:@"恩" otherButtonTitles:nil] autorelease] show];
    return YES;
}

@end
