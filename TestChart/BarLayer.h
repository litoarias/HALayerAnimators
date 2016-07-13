//
//  Bar.h
//  TestChart
//
//  Created by Hipolito Arias on 3/7/16.
//  Copyright © 2016 Hipolito Arias. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface BarLayer : CAShapeLayer

- (void)computePath:(CGRect)r;
- (void)showProgress;

@end
