//
//  CircleView.h
//  HABarChart
//
//  Created by Hipolito Arias on 13/7/16.
//  Copyright © 2016 Hipolito Arias. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface CircleView : UIView

@property (nonatomic) IBInspectable UIColor *strokeColor;
@property (nonatomic) IBInspectable BOOL dottedLine;
@property (nonatomic) IBInspectable NSInteger lineWidth;
@property (nonatomic) IBInspectable NSInteger animateDuration;



@end
