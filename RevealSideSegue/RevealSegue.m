//
//  SiderSegue.m
//  iDYM
//
//  Created by qian cheng on 13-4-3.
//  Copyright (c) 2013年 Ê¥ªÊ≥ïÂÑøÁΩë. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "RevealSegue.h"

@implementation RevealSegue

- (void)perform {
    UIViewController *current = self.sourceViewController;
    UIViewController *next = self.destinationViewController;

    
    UIView *revealedView = next.view;
    UIView *baseView = current.view;
    
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    CGRect expectedFrame = [baseView convertRect:appFrame fromView:nil];
    
    CGRect baseViewFrame;
    
    switch (self.direction) {
        case RevealSegueLeft:
            revealedView.frame = CGRectMake(0, expectedFrame.origin.y, self.width, expectedFrame.size.height);
            [baseView.superview insertSubview:revealedView belowSubview:baseView];
            baseViewFrame = CGRectOffset(baseView.frame, self.width, 0);
            break;
        case RevealSegueRight:
            revealedView.frame = CGRectMake(baseView.frame.size.width - self.width, expectedFrame.origin.y, self.width, expectedFrame.size.height);
            [baseView.superview insertSubview:revealedView belowSubview:baseView];
            baseViewFrame = CGRectOffset(baseView.frame, -self.width, 0);
            break;
        default:
            baseViewFrame = (CGRect){CGPointZero, baseView.frame.size};
            break;
    }
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        baseView.frame = baseViewFrame;
    } completion:^(BOOL finished) {
        if (finished) {
            if (self.direction == RevealSegueNo) {
                [revealedView removeFromSuperview];
            }
        }
    }];
    
    [self handleShadows];
    
}

- (void) handleShadows {
//    if ([self isOptionEnabled:PPRevealSideOptionsShowShadows]) {
    if ([self showShadows]) {
        [self addShadow];
    }
    else
    {
        [self removeShadow];
    }
}

- (void) addShadow
{
    UIViewController *_rootViewController = self.sourceViewController;
//    UIViewController *next = self.destinationViewController;
    _rootViewController.view.layer.shadowOffset = CGSizeZero;
    _rootViewController.view.layer.shadowOpacity = 0.75f;
    _rootViewController.view.layer.shadowRadius = 10.0f;
    _rootViewController.view.layer.shadowColor = [UIColor blackColor].CGColor;
    _rootViewController.view.layer.shadowPath = [UIBezierPath bezierPathWithRect:_rootViewController.view.layer.bounds].CGPath;
    _rootViewController.view.clipsToBounds = NO;
}

- (void) removeShadow
{
    UIViewController *_rootViewController = self.sourceViewController;
    _rootViewController.view.layer.shadowPath = nil;
    _rootViewController.view.layer.shadowOpacity = 0.0f;
    _rootViewController.view.layer.shadowRadius = 0.0;
    _rootViewController.view.layer.shadowColor = nil;
}
@end
