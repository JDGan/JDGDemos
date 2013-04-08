//
//  JDGAppDelegate.m
//  Flyweight
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGAppDelegate.h"
#include "Flyweight.h" 
#include "FlyweightFactory.h"
@implementation JDGAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    FlyweightFactory* fc = new FlyweightFactory();
    Flyweight* fw1 = fc->GetFlyweight("hello");
    Flyweight* fw2 = fc->GetFlyweight("world!");
    Flyweight* fw3 = fc->GetFlyweight("hello");
    return YES;
}
							
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    NSString *str = [NSString stringWithFormat:@"%@",url];
    [[[[UIAlertView alloc]initWithTitle:str message:nil delegate:nil cancelButtonTitle:@"恩" otherButtonTitles:nil] autorelease] show];
    return YES;
}

@end
