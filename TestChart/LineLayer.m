//
//  LineLayer.m
//  TestChart
//
//  Created by Hipolito Arias on 4/7/16.
//  Copyright © 2016 Hipolito Arias. All rights reserved.
//

#import "LineLayer.h"

@implementation LineLayer

@synthesize length = _length;
@synthesize startPoint= _startPoint;
@synthesize width= _width;

- (id) initWithLayer:(id)layer
{
    if(self = [super initWithLayer:layer])
    {
        if([layer isKindOfClass:[LineLayer class]])
        {
            LineLayer *other = (LineLayer*)layer;
            self.length = other.length;
            self.startPoint = other.startPoint;
            self.width = other.width;
        }
    }
    return self;
}


+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"length"])
    {
        return YES;
    }
    return [super needsDisplayForKey:key];
}


- (void) setLength:(int)newLength
{
    if (newLength < 0)
    {
        return;
    }
    _length = newLength;
    [self setNeedsDisplay];
}


- (void) drawInContext:(CGContextRef)context
{
    CGContextSetStrokeColorWithColor(context, [UIColor purpleColor].CGColor);
    CGContextSetLineWidth(context, _width);
    CGContextMoveToPoint(context, _startPoint.x, _startPoint.y);
    CGContextAddLineToPoint(context, _startPoint.x, _startPoint.y - _length);
    CGContextStrokePath(context);
}

@end
