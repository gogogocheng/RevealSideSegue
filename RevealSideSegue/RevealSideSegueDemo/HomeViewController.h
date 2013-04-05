//
//  HomeViewController.h
//  iDYM
//
//  Created by qian cheng on 13-4-3.
//  Copyright (c) 2013年 活法儿网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *siderWidth;
@property (weak, nonatomic) IBOutlet UILabel *siderWidthLabel;
@property (strong,nonatomic) UIView *leftSidebarView;
@property (weak, nonatomic) IBOutlet UISwitch *leftorright;
@property (weak, nonatomic) IBOutlet UISwitch *shadow;
//- (IBAction)lefts:(id)sender;
- (IBAction)changeSiderWidth:(id)sender;
@end
