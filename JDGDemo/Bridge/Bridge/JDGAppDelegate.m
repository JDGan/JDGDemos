//
//  JDGAppDelegate.m
//  Bridge
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGAppDelegate.h"
#include "Abstraction.h" 
#include "AbstractionImp.h"

@implementation JDGAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    AbstractionImp* imp = new ConcreteAbstractionImpA();
    Abstraction* abs = new RefinedAbstraction(imp);
    abs->Operation();
    
    return YES;
}
							
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    NSString *str = [NSString stringWithFormat:@"%@",url];
    [[[[UIAlertView alloc]initWithTitle:str message:nil delegate:nil cancelButtonTitle:@"恩" otherButtonTitles:nil] autorelease] show];
    return YES;
}


@end
