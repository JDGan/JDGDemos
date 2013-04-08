//
//  JDGChatViewController.m
//  BlueToothChat
//
//  Created by Gan LL on 13-3-27.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

#import "JDGChatViewController.h"
#import "JDGBlueToothKit.h"


@interface JDGChatViewController ()
<JDGBlueToothKitDelegate>
{
    CGRect originFrame;
    NSMutableArray *dataSource;
}
@end

@implementation JDGChatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    dataSource = [[NSMutableArray alloc] init];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    JDGBlueToothKit *kit = [JDGBlueToothKit sharedInstance];
    kit.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendPressed:(id)sender
{
    [self.view endEditing:YES];
    JDGBlueToothKit *kit = [JDGBlueToothKit sharedInstance];
    UITextField *field = (UITextField *)_enterField.customView;
    NSString *text = [NSString stringWithFormat:@"%@:%@",[[UIDevice currentDevice] name],field.text];
    [self insertRowWithString:text];
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    [kit sendData:data];
    field.text = @"";
}

- (void)didReceiveData:(NSData *)data fromPeer:(NSString *)peerID
{
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [self insertRowWithString:string];
    NSLog(@"peerID = %@",peerID);
    [string release];
}

- (void)dealloc {
    [[JDGBlueToothKit sharedInstance] disconnect];
    [_enterField release];
    [_chatToolBar release];
    [_chatTable release];
    [super dealloc];
}

- (void)insertRowWithString:(NSString *)rowStr
{
    [_chatTable reloadData];
    [dataSource addObject:rowStr];
    [_chatTable beginUpdates];
    NSIndexPath *lastIndex = [NSIndexPath indexPathForRow:[dataSource count]-1 inSection:0];
    NSArray *indexArr = [NSArray arrayWithObject:lastIndex];
    [_chatTable insertRowsAtIndexPaths:indexArr withRowAnimation:UITableViewRowAnimationBottom];
    [_chatTable endUpdates];
    
    [_chatTable scrollToRowAtIndexPath:lastIndex atScrollPosition:UITableViewScrollPositionBottom animated:NO];
}

- (void)changeToolbarFrameWithRect:(CGRect)endRect andDuration:(float)duration
{
    CGRect SCREEN_BOUNDS = [[UIScreen mainScreen] bounds];
    
    [UIView beginAnimations:@"maoveInputBarWithKeyboardHeight" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationDidStopSelector:@selector(moveInputBarDidStop)];
    
    float keyBoardHeight = SCREEN_BOUNDS.size.height-endRect.origin.y;
    CGRect tmpFrame = CGRectZero;
    
    tmpFrame.origin = originFrame.origin;
    tmpFrame.size = originFrame.size;
    tmpFrame.origin.y = ((_chatToolBar.superview.frame.size.height == SCREEN_BOUNDS.size.height)?_chatToolBar.superview.frame.size.height-20:_chatToolBar.superview.frame.size.height) - tmpFrame.size.height - keyBoardHeight;
    
    
    _chatToolBar.frame = tmpFrame;
    [UIView commitAnimations];
}

- (void)keyboardChange:(NSNotification *)note
{
    NSDictionary *userInfo = [note userInfo];
    originFrame = _chatToolBar.frame;
    
    // Get the origin of the keyboard when it's displayed.
//    NSValue* beginValue = [userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
    NSValue* endValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    // Get the top of the keyboard as the y coordinate of its origin in self's view's coordinate system. The bottom of the text view's frame should align with the top of the keyboard's final position.
//    CGRect keyBoardRectBegin = [beginValue CGRectValue];
    CGRect endRect = [endValue CGRectValue];
    
    // Get the duration of the animation.
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval duration;
    [animationDurationValue getValue:&duration];
    
    // Animate the resize of the text view's frame in sync with the keyboard's appearance.
    
    [self changeToolbarFrameWithRect:endRect andDuration:duration];
    NSLog(@"**********************keyboardWillChange**********************");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BlueToothChatCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = [dataSource objectAtIndex:indexPath.row];
    return cell;
}


@end
