//
//  SiderViewController.h
//  iDYM
//
//  Created by qian cheng on 13-4-4.
//  Copyright (c) 2013年 Ê¥ªÊ≥ïÂÑøÁΩë. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RevealSegue.h"

@interface SideViewController : UIViewController
@property (nonatomic,weak) id<SiderSegueDelegate> delegate;
- (IBAction)test:(id)sender;
@end
