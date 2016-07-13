//
//  CircleLayer.h
//  HABarChart
//
//  Created by Hipolito Arias on 13/7/16.
//  Copyright © 2016 Hipolito Arias. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLayer : CAShapeLayer

- (void)computePathWithRect:(CGRect)rect
                strokeColor:(UIColor *)strokeColor
                 dottedLine:(BOOL)dottedLine
                  lineWidth:(NSInteger)lineWidth
            animateDuration:(NSInteger)animateDuration;

@end
