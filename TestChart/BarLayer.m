//
//  Bar.m
//  TestChart
//
//  Created by Hipolito Arias on 3/7/16.
//  Copyright © 2016 Hipolito Arias. All rights reserved.
//

#import "BarLayer.h"

@implementation BarLayer

- (id)init
{
    self = [super init];
    if (self)
    {
        self.path = CGPathCreateWithRect(CGRectMake(0, 0, 50, 50), 0);
        self.strokeColor = [UIColor greenColor].CGColor;
        self.lineWidth = 40;
        self.lineCap = kCALineCapSquare;
        self.lineJoin = kCALineJoinBevel;
        self.strokeEnd = 0.001;
    }
    return self;
}

- (void)computePath:(CGRect)r
{
    self.path = CGPathCreateWithRect(r, 0);
}


-(void)showProgress
{
    float advance = 0.1;
    
    if (self.strokeEnd > 1)
    {
        self.strokeEnd = 0;
    }
    
    CABasicAnimation * swipe = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    swipe.duration = 0.25;
    swipe.fromValue = [NSNumber numberWithDouble:self.strokeEnd];
    swipe.toValue = [NSNumber numberWithDouble:self.strokeEnd + advance];
    
    swipe.fillMode = kCAFillModeForwards;
    swipe.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    swipe.removedOnCompletion = NO;
    self.strokeEnd = self.strokeEnd + advance;
    
    [self addAnimation:swipe forKey:@"strokeEnd animation"];
}


@end
