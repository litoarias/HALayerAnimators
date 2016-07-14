//
//  Bar.m
//  TestChart
//
//  Created by Hipolito Arias on 3/7/16.
//  Copyright © 2016 Hipolito Arias. All rights reserved.
//

#import "BarLayer.h"
#import "BarView.h"

@interface BarLayer ()
{
    CGPoint movePoint;
    CGPoint addLine;
    UIBezierPath *path;
}
@end

@implementation BarLayer

- (void)computePathWithRect:(CGRect)rect
                strokeColor:(UIColor *)strokeColor
                 dottedLine:(BOOL)dottedLine
                  lineWidth:(NSInteger)lineWidth
                  direction:(NSUInteger)direction
            animateDuration:(NSInteger)animateDuration
{
    self.strokeColor = strokeColor.CGColor;
    self.fillColor = nil;
    self.lineWidth = lineWidth;
    self.lineCap = kCALineCapRound;
    self.strokeStart = 0;
    self.strokeEnd = 1;
    self.path = CGPathCreateWithEllipseInRect(rect, 0);
    
    if (dottedLine)
    {
        self.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil];
    }
    
    path = [UIBezierPath bezierPath];
    
    [self obtainPointsToMoveWithDirection:direction rect:rect];
    
    [self obtainPathToMoveWithDirection:direction rect:rect];
    
    self.path = path.CGPath;
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = animateDuration;
    animation.fromValue = [NSNumber numberWithDouble:0.0];
    animation.toValue = [NSNumber numberWithDouble:1.0];
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion = NO;
    
    [self addAnimation:animation forKey:@"strokeEnd"];
    
}


- (void)obtainPointsToMoveWithDirection:(AnimateDirection)direction rect:(CGRect)rect
{
    switch (direction)
    {
        case TopToBottom:
        {
            movePoint = CGPointMake(0.0, rect.size.height);
            addLine = CGPointMake(0, 0);
        }
            break;
            
        case BottomToTop:
        {
            movePoint = CGPointMake(0.0, rect.size.height);
            addLine = CGPointMake(0, 0);
        }
            break;
            
        case LeftToRight:
        {
            movePoint = CGPointMake(rect.size.width, 0.0);
            addLine = CGPointMake(0.0, 0);
        }
            break;
            
        case RightToLeft:
        {
            movePoint = CGPointMake(rect.size.width, 0.0);
            addLine = CGPointMake(0.0, 0);
        }
            break;
            
        default:
        {
            movePoint = CGPointMake(0.0, rect.size.height);
            addLine = CGPointMake(0, 0);
        }
            break;
    }
    
}

- (void)obtainPathToMoveWithDirection:(AnimateDirection)direction rect:(CGRect)rect
{
    switch (direction)
    {
        case TopToBottom:
        {
            [path moveToPoint:addLine];
            [path addLineToPoint:movePoint];
        }
            break;
            
        case BottomToTop:
        {
            [path moveToPoint:movePoint];
            [path addLineToPoint:addLine];
        }
            break;
            
        case LeftToRight:
        {
            [path moveToPoint:addLine];
            [path addLineToPoint:movePoint];
        }
            break;
            
        case RightToLeft:
        {
            [path moveToPoint:movePoint];
            [path addLineToPoint:addLine];
        }
            break;
            
        default:
        {
            [path moveToPoint:movePoint];
            [path addLineToPoint:addLine];
        }
            break;
    }
}

# warning Progress
//-(id)init {
//    self=[super init];
//    if (self) {
//        self.path = CGPathCreateWithEllipseInRect(CGRectMake(0, 0, 50, 50), 0);
//        self.strokeColor = [UIColor greenColor].CGColor;
//        self.lineWidth=40;
//        self.lineCap = kCALineCapRound;
//        self.strokeEnd=0.001;
//    }
//    return self;
//}
//
//-(void) computePath:(CGRect)r {
//    self.path = CGPathCreateWithEllipseInRect(r, 0);
//}
//
//
//-(void)showProgress {
//    float advance=0.1;
//    if (self.strokeEnd>1) self.strokeEnd=0;
//
//    CABasicAnimation * swipe = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    swipe.duration=0.25;
//    swipe.fromValue=[NSNumber numberWithDouble:self.strokeEnd];
//    swipe.toValue=  [NSNumber numberWithDouble:self.strokeEnd + advance];
//
//    swipe.fillMode = kCAFillModeForwards;
//    swipe.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    swipe.removedOnCompletion=NO;
//    self.strokeEnd = self.strokeEnd + advance;
//    [self addAnimation:swipe forKey:@"strokeEnd animation"];
//}



@end
