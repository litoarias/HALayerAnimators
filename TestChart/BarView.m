//
//  BarView.m
//  TestChart
//
//  Created by Hipolito Arias on 3/7/16.
//  Copyright © 2016 Hipolito Arias. All rights reserved.
//

#import "BarView.h"
//#import "BarLayer.h"
#import "LineLayer.h"

@interface BarView ()
@property (strong, nonatomic) LineLayer *lineLayer;
@end

@implementation BarView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
//        [(BarLayer *)self.layer computePath:self.bounds];
        
        self.restorationIdentifier = @"Noviembre";
        
        [self setupLayer];
    }
    return self;
}

# pragma mark - UIResponder

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    ////    BarLayer * l =  (BarLayer *)self.layer;
    ////    [l showProgress];
    NSLog(@"touchBegan");
    [self logTouches: event];
    self.layer.opacity = 0.5;
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchMoved");
    [self logTouches: event];
    self.layer.opacity = 0.5;
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchEnded");
    [self logTouches: event];
    self.layer.opacity = 1.0;
}



- (void)logTouches:(UIEvent*)event
{
    int count = 1;
    
    for (UITouch* touch in event.allTouches)
    {
        CGPoint location = [touch locationInView: self];
        NSLog(@"%d: (%.0f, %.0f)", count, location.x, location.y);
        count++;
    }
}


- (void)drawRect:(CGRect)rect
{
    [[UIColor clearColor] setStroke];
    UIRectFrame(self.bounds);
}


- (void)setupLayer
{
    _lineLayer = [LineLayer new];
    _lineLayer.frame = CGRectMake(0,
                                  CGRectGetWidth(self.frame) - CGRectGetWidth(self.frame),
                                  CGRectGetWidth(self.frame),
                                  CGRectGetHeight(self.frame) + CGRectGetWidth(self.frame));
    [_lineLayer setNeedsDisplay];
    _lineLayer.startPoint = CGPointMake(0, CGRectGetHeight(self.frame));
    _lineLayer.width = CGRectGetWidth(self.frame) * 2;
    _lineLayer.length = CGRectGetHeight(self.frame);
    [self.layer addSublayer:_lineLayer];
    [_lineLayer addAnimation:[self animation] forKey:@"animateLength"];
}


- (CABasicAnimation *)animation
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"length"];
    anim.duration = 1;
    anim.fromValue = [NSNumber numberWithInt:0];
    anim.toValue = [NSNumber numberWithInt:CGRectGetHeight(self.frame)];
    
    return anim;
}


//+ (Class)layerClass
//{
//    return [BarLayer class];
//}

@end
