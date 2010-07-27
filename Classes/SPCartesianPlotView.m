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
@synthesize drawXTickMarks;
@synthesize yMaxValue;
@synthesize yMinValue;

#pragma mark Initialization

- (id)initWithFrame:(NSRect)frame;
{
    if (!(self = [super initWithFrame:frame])) {
        return nil;
    }

    drawXAxis = YES;
    drawXTickMarks = YES;
    yMaxValue = 1.0f;
    yMinValue = -1.0f;

    return self;
}

#pragma mark NSView

- (void)drawRect:(NSRect)dirtyRect;
{
    [super drawRect:dirtyRect];
}

@end
