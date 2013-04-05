//
//  SiderSegue.h
//  iDYM
//
//  Created by qian cheng on 13-4-3.
//  Copyright (c) 2013年 Ê¥ªÊ≥ïÂÑøÁΩë. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    RevealSegueNo,
    RevealSegueLeft,
    RevealSegueRight
} RevealSegueDirection;

@protocol SiderSegueDelegate <NSObject>
- (void)CloseSwipeMenu:(UIViewController *)destinationView;
@end

typedef NSUInteger SideOptions;

@interface RevealSegue : UIStoryboardSegue

@property (nonatomic,assign) RevealSegueDirection direction;
@property (nonatomic) int width;
@property (nonatomic) BOOL showShadows;


@end
