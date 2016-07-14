//
//  BarView.m
//  TestChart
//
//  Created by Hipolito Arias on 3/7/16.
//  Copyright © 2016 Hipolito Arias. All rights reserved.
//

#import "BarView.h"
#import "BarLayer.h"

@interface BarView ()

@property (strong, nonatomic) BarLayer *barLayer;

@end

@implementation BarView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor clearColor] setStroke];
    UIRectFrame(self.bounds);
    
    self.strokeColor = self.strokeColor;
    self.dottedLine = self.dottedLine;
    self.lineWidth = self.lineWidth;
    self.animateDuration = self.animateDuration;
    self.direction = self.direction;
    
    [(BarLayer *)self.layer computePathWithRect:self.bounds
                                    strokeColor:self.strokeColor
                                     dottedLine:self.dottedLine
                                      lineWidth:self.lineWidth
                                      direction:self.direction
                                animateDuration:self.animateDuration];
    
}
# pragma mark - UIResponder

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan:withEvent: %@", event);
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



+ (Class)layerClass
{
    return [BarLayer class];
}

@end
