//
//  LineLayer.h
//  TestChart
//
//  Created by Hipolito Arias on 4/7/16.
//  Copyright © 2016 Hipolito Arias. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LineLayer : CALayer

@property (nonatomic, assign) int length;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGFloat width;

@end
