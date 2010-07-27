//
//  SPCartesianPlotView.m
//  SimplePlot
//
//  Created by Sam Wen on 7/27/10.
//  Copyright 2010 Square. All rights reserved.
//

#import "SPCartesianPlotView.h"


@implementation SPCartesianPlotView

@synthesize drawXAxis;
@synthesize xAxisColor;
@synthesize drawXTickMarks;
@synthesize xTickMarksColor;
@synthesize yMaxValue;
@synthesize yMinValue;

#pragma mark Initialization

- (id)initWithFrame:(NSRect)frame;
{
    if (!(self = [super initWithFrame:frame])) {
        return nil;
    }

    drawXAxis = YES;
    self.xAxisColor = [NSColor redColor];
    drawXTickMarks = YES;
    self.xTickMarksColor = [NSColor redColor];
    yMaxValue = 1.0f;
    yMinValue = -1.0f;

    return self;
}

#pragma mark NSView

- (void)drawRect:(NSRect)dirtyRect;
{
    [super drawRect:dirtyRect];

    CGFloat zeroLevel = (-yMinValue) / (yMaxValue - yMinValue) * [self frame].size.height;

    if (self.drawXAxis && zeroLevel > 0.0f) {
        [self.xAxisColor setStroke];
        NSBezierPath *xAxis = [NSBezierPath bezierPath];
        [xAxis moveToPoint:NSMakePoint(0.0f, zeroLevel)];
        [xAxis lineToPoint:NSMakePoint([self frame].size.width, zeroLevel)];
        [xAxis stroke];
    }

    if (self.drawXTickMarks && zeroLevel > 0.0f && [self frame].size.width > 15.0f) {
        [self.xTickMarksColor setStroke];
        
        NSBezierPath *ticks = [NSBezierPath bezierPath];
        for (int xCoordinate = 0; xCoordinate < [self frame].size.width; xCoordinate += 15) {
            [ticks moveToPoint:NSMakePoint((CGFloat)xCoordinate, zeroLevel + 5.0f)];
            [ticks lineToPoint:NSMakePoint((CGFloat)xCoordinate, zeroLevel - 5.0f)];
        }
        [ticks stroke];
    }    
}

@end
