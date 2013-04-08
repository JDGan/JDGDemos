//
//  JDGAppDelegate.m
//  Iterator
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGAppDelegate.h"
#include "Iterator.h"
#include "Aggregate.h"


@implementation JDGAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    Aggregate* ag = new ConcreteAggregate();
    Iterator* it = new ConcreteIterator(ag);
    for (; !(it->IsDone()) ;
         it->Next())
    {
        cout<<it->CurrentItem()<<endl;
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    NSString *str = [NSString stringWithFormat:@"%@",url];
    [[[[UIAlertView alloc]initWithTitle:str message:nil delegate:nil cancelButtonTitle:@"恩" otherButtonTitles:nil] autorelease] show];
    return YES;
}

@end
