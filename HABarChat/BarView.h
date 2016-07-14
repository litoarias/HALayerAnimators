//
//  BarView.h
//  TestChart
//
//  Created by Hipolito Arias on 3/7/16.
//  Copyright © 2016 Hipolito Arias. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AnimateDirection)
{
    TopToBottom,
    BottomToTop,
    LeftToRight,
    RightToLeft
};

IB_DESIGNABLE

@interface BarView : UIView

@property (nonatomic) IBInspectable UIColor *strokeColor;
@property (nonatomic) IBInspectable BOOL dottedLine;
@property (nonatomic) IBInspectable NSInteger lineWidth;
@property (nonatomic) IBInspectable NSInteger animateDuration;
#if TARGET_INTERFACE_BUILDER
@property (nonatomic) IBInspectable NSUInteger direction;
#else
@property (nonatomic) AnimateDirection direction;
#endif

@end