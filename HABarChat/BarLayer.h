//
//  Bar.h
//  TestChart
//
//  Created by Hipolito Arias on 3/7/16.
//  Copyright © 2016 Hipolito Arias. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface BarLayer : CAShapeLayer

- (void)computePathWithRect:(CGRect)rect
                strokeColor:(UIColor *)strokeColor
                 dottedLine:(BOOL)dottedLine
                  lineWidth:(NSInteger)lineWidth
                  direction:(NSUInteger)direction
            animateDuration:(NSInteger)animateDuration;

@end
