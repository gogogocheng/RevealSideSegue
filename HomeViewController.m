//
//  HomeViewController.m
//  iDYM
//
//  Created by qian cheng on 13-4-3.
//  Copyright (c) 2013年 活法儿网. All rights reserved.
//

#import "HomeViewController.h"

#import "RevealSegue.h"
#import "SideViewController.h"

@interface HomeViewController () <SiderSegueDelegate>
@property (nonatomic)BOOL showMenu;
@property (nonatomic,strong) UIViewController *siderViewController;
@end

@implementation HomeViewController
@synthesize leftSidebarView;
@synthesize leftorright;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLeftorright:nil];
    [self setShadow:nil];
    [self setSiderWidth:nil];
    [self setSiderWidthLabel:nil];
    [super viewDidUnload];
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    RevealSegue *lss = (RevealSegue *)segue;
    lss.showShadows = self.shadow.isOn;

    if (self.showMenu) {
        lss.direction = RevealSegueNo;
        self.siderViewController = nil;
        [((SideViewController *)lss.destinationViewController) setDelegate:nil];
    } else {
        self.siderViewController = (SideViewController *)lss.destinationViewController;
        [((SideViewController *)lss.destinationViewController) setDelegate:self];
        if ([lss.identifier isEqualToString:@"LeftSwipe"]) {
            lss.direction =RevealSegueLeft;
        } else if([lss.identifier isEqualToString:@"RightSwipe"]) {
            lss.direction =RevealSegueRight;
        } else {
            if (leftorright.isOn) {
                lss.direction =RevealSegueRight;
            } else {
                lss.direction =RevealSegueLeft;
            }
        }
    }
    self.showMenu = !self.showMenu;
    lss.width = self.siderWidth.value;
}

- (void)CloseSwipeMenu:(UIViewController *)destinationView {
    RevealSegue *ss = [[RevealSegue alloc]initWithIdentifier:@"aa" source:self destination:destinationView];
    [self prepareForSegue:ss sender:nil];
    [ss perform];
}


- (IBAction)changeSiderWidth:(id)sender {
    self.siderWidthLabel.text = [NSString stringWithFormat:@"%d",(int)self.siderWidth.value];
}
@end
