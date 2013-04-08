//
//  JDGChatViewController.h
//  BlueToothChat
//
//  Created by Gan LL on 13-3-27.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDGChatViewController : UIViewController
<UITableViewDataSource
,UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UIToolbar *chatToolBar;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *enterField;

@property (retain, nonatomic) IBOutlet UITableView *chatTable;

- (IBAction)sendPressed:(id)sender;
@end
