//
//  SPLinePlotView.m
//  SimplePlot
//
//  Created by Sam Wen on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SPLineGraphView.h"
#import "SPView.h"


@implementation SPLineGraphView

@synthesize dataSource;
@synthesize drawXAxis;
@synthesize drawXTickMarks;
@synthesize downSampleGraphToFrame;
@synthesize yMaxValue;
@synthesize yMinValue;

#pragma mark Initialization

- (id)initWithFrame:(NSRect)frame;
{
    if (!(self = [super initWithFrame:frame])) {
        return nil;
    }

    downSampleGraphToFrame = YES;
    drawXAxis = YES;
    drawXTickMarks = YES;
    yMaxValue = 1.0f;
    yMinValue = -1.0f;

    return self;
}

- (void)dealloc;
{
    [super dealloc];
}

#pragma mark NSView

- (void)drawRect:(NSRect)dirtyRect;
{
    [super drawRect:dirtyRect];

    CGFloat zeroLevel = (-yMinValue) / (yMaxValue - yMinValue) * [self frame].size.height;

    if (self.drawXAxis && zeroLevel > 0.0f) {
        [[NSColor redColor] setStroke];
        NSBezierPath *xAxis = [NSBezierPath bezierPath];
        [xAxis moveToPoint:NSMakePoint(0.0f, zeroLevel)];
        [xAxis lineToPoint:NSMakePoint([self frame].size.width, zeroLevel)];
        [xAxis stroke];
    }

    if (self.drawXTickMarks && zeroLevel > 0.0f && [self frame].size.width > 15.0f) {
        [[NSColor redColor] setStroke];
    
        NSBezierPath *ticks = [NSBezierPath bezierPath];
        for (int xCoordinate = 0; xCoordinate < [self frame].size.width; xCoordinate += 15) {
            [ticks moveToPoint:NSMakePoint((CGFloat)xCoordinate, zeroLevel + 5.0f)];
            [ticks lineToPoint:NSMakePoint((CGFloat)xCoordinate, zeroLevel - 5.0f)];
        }
        [ticks stroke];
    }
    
    NSArray *data = [dataSource evenlySpacedMagnitudesInLineGraphView:self];

    if ([data count]) {
        [[NSColor greenColor] setStroke];

        NSBezierPath *graph = [NSBezierPath bezierPath];

        long skip = 1;
        if (self.downSampleGraphToFrame) {
            skip = [data count] / [self bounds].size.width;
        }

        for (long xCoordinate = 0; xCoordinate < (long)[self frame].size.width; ++xCoordinate) {
            CGFloat yCoordinate = ([[data objectAtIndex:(xCoordinate * skip)] floatValue] - yMinValue) / (yMaxValue - yMinValue);
            yCoordinate *= [self bounds].size.height;
            if (xCoordinate == 0) {
                [graph moveToPoint:NSMakePoint(roundf((CGFloat)xCoordinate), yCoordinate)];
            } else {
                [graph lineToPoint:NSMakePoint(roundf((CGFloat)xCoordinate), yCoordinate)];
            }
        }

        [graph stroke];        
    }
}

@end
