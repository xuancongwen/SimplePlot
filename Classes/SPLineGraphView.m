//
//  SPLinePlotView.m
//  SimplePlot
//
//  Created by Sam Wen on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SPLineGraphView.h"


@implementation SPLineGraphView

@synthesize dataSource;
@synthesize color;
@synthesize downSampleGraphToFrame;

#pragma mark Initialization

- (id)initWithFrame:(NSRect)frame;
{
    if (!(self = [super initWithFrame:frame])) {
        return nil;
    }

    downSampleGraphToFrame = YES;
    self.color = [NSColor greenColor];

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

    NSArray *data = [dataSource evenlySpacedMagnitudesInLineGraphView:self];

    if ([data count]) {
        [self.color setStroke];

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
