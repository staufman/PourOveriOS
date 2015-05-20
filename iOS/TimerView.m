//
//  TimerView.m
//  PourOveriOS
//
//  Created by Admin on 5/19/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "TimerView.h"

@interface TimerView ()

@property (nonatomic, strong) UIColor *timerColor;

@end

@implementation TimerView

/*RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(processString:(NSString *)input callback:(RCTResponseSenderBlock)callback)
{
	callback(@[[input stringByReplacingOccurrencesOfString:@"Goodbye" withString:@"Hello"]]);
}*/

- (instancetype)init
{
    if (self = [super init])
    {
        self.timerColor = [UIColor blackColor];
    }
    return self;
}

- (CGFloat)degree2Radian:(CGFloat)a {
    return M_PI * a / 180.0;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // decide on radius
    CGFloat rad = CGRectGetWidth(rect) / 3.5;
    
    for (NSInteger i = 0; i < 60; i++) {
        // save the original position and origin
        CGContextSaveGState(context);
        
        // make translation
        CGContextTranslateCTM(context, CGRectGetMidX(rect), CGRectGetMidY(rect));
        
        // make rotation
        CGContextRotateCTM(context, [self degree2Radian:(CGFloat)i * 6]);

        if (i % 5 == 0) {
            // if an hour position we want a line slightly longer
            //drawSecondMarker(ctx: ctx, x: rad-15, y:0, radius:rad, color: UIColor.whiteColor())
            [self drawSecondMarker:context x:rad-15 y:0 radius:rad color:self.timerColor];
        }
        else {
            [self drawSecondMarker:context x:rad-10 y:0 radius:rad color:self.timerColor];
        }
        
        // restore state before next translation
        CGContextRestoreGState(context);
    }
}

- (void)drawSecondMarker:(CGContextRef)context
                       x:(CGFloat)x
                       y:(CGFloat)y
                  radius:(CGFloat)radius
                   color:(UIColor *)color {
    
    // generate a path
    CGMutablePathRef path = CGPathCreateMutable();
    
    // move to starting point on edge of circle
    CGPathMoveToPoint(path, nil, radius, 0);
    
    // draw line of required length
    CGPathAddLineToPoint(path, nil, x, y);
    
    // close subpath
    CGPathCloseSubpath(path);
    
    // add the path to the context
    CGContextAddPath(context, path);
    
    // set the line width
    CGContextSetLineWidth(context, 1.5);
    
    // set the line color
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    // draw the line
    CGContextStrokePath(context);
    
    CGPathRelease(path);
}

@end


