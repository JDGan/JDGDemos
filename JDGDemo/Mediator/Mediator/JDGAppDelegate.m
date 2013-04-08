//
//  JDGAppDelegate.m
//  Mediator
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGAppDelegate.h"

#include "Mediator.h"
#include "Colleage.h"


@implementation JDGAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    ConcreteMediator* m = new ConcreteMediator();
    ConcreteColleageA* c1 = new ConcreteColleageA(m);
    ConcreteColleageB* c2 = new ConcreteColleageB(m);
    m->IntroColleage(c1,c2);
    c1->SetState("old");
    c2->SetState("old");
    c1->Aciton();
    c2->Aciton();
    cout<<endl;
    c1->SetState("new");
    c1->Aciton();
    c2->Aciton();
    cout<<endl;
    c2->SetState("old");
    c2->Aciton();
    c1->Aciton();
    return YES;
}
							
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    NSString *str = [NSString stringWithFormat:@"%@",url];
    [[[[UIAlertView alloc]initWithTitle:str message:nil delegate:nil cancelButtonTitle:@"恩" otherButtonTitles:nil] autorelease] show];
    return YES;
}
@end
