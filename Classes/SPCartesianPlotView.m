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
@synthesize drawYAxis;
@synthesize yAxisColor;
@synthesize drawXTickMarks;
@synthesize xTickMarksColor;
@synthesize drawYTickMarks;
@synthesize yTickMarksColor;
@synthesize xMaxValue;
@synthesize xMinValue;
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
    drawYAxis = YES;
    self.yAxisColor = [NSColor redColor];
    drawXTickMarks = YES;
    self.xTickMarksColor = [NSColor redColor];
    drawYTickMarks = YES;
    self.yTickMarksColor = [NSColor redColor];
    xMaxValue = 1.0f;
    xMinValue = 1.0f;
    yMaxValue = 1.0f;
    yMinValue = -1.0f;

    return self;
}

#pragma mark NSView

- (void)drawRect:(NSRect)dirtyRect;
{
    [super drawRect:dirtyRect];

    CGFloat zeroYLevel = (-yMinValue) / (yMaxValue - yMinValue) * [self frame].size.height;

    if (self.drawXAxis && zeroYLevel > 0.0f) {
        [self.xAxisColor setStroke];

        NSBezierPath *xAxis = [NSBezierPath bezierPath];
        [xAxis moveToPoint:NSMakePoint(0.0f, zeroYLevel)];
        [xAxis lineToPoint:NSMakePoint([self frame].size.width, zeroYLevel)];
        [xAxis stroke];
    }

    if (self.drawXTickMarks && zeroYLevel > 0.0f && [self frame].size.width > 15.0f) {
        [self.xTickMarksColor setStroke];

        NSBezierPath *ticks = [NSBezierPath bezierPath];
        for (int xCoordinate = 0; xCoordinate < [self frame].size.width; xCoordinate += 15) {
            [ticks moveToPoint:NSMakePoint((CGFloat)xCoordinate, zeroYLevel + 5.0f)];
            [ticks lineToPoint:NSMakePoint((CGFloat)xCoordinate, zeroYLevel - 5.0f)];
        }
        [ticks stroke];
    }

    CGFloat zeroXLevel = (-xMinValue) / (xMinValue - xMaxValue) * [self frame].size.width;

    if (self.drawYAxis && zeroXLevel > 0.0f) {
        [self.yAxisColor setStroke];

        NSBezierPath *yAxis = [NSBezierPath bezierPath];
        [yAxis moveToPoint:NSMakePoint(zeroXLevel, 0.0f)];
        [yAxis lineToPoint:NSMakePoint(zeroXLevel, [self frame].size.height)];
        [yAxis stroke];
    }
    
    if (self.drawYTickMarks && zeroXLevel > 0.0f && [self frame].size.height > 15.0f) {
        [self.yTickMarksColor setStroke];

        NSBezierPath *ticks = [NSBezierPath bezierPath];
        for (int yCoordinate = 0; yCoordinate < [self frame].size.height; yCoordinate += 15) {
            [ticks moveToPoint:NSMakePoint(zeroYLevel + 5.0f, (CGFloat)yCoordinate)];
            [ticks lineToPoint:NSMakePoint(zeroYLevel - 5.0f, (CGFloat)yCoordinate)];
        }
        [ticks stroke];
    }    
}

@end
