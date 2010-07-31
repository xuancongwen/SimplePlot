//
//  SPScatterPlotView.m
//  SimplePlot
//
//  Created by Sam Wen on 7/27/10.
//  Copyright 2010 Square. All rights reserved.
//

#import "SPScatterPlotView.h"


@implementation SPScatterPlotView

@synthesize dataSource;
@synthesize color;

#pragma mark Initialization

- (id)initWithFrame:(NSRect)frame;
{
    if (!(self = [super initWithFrame:frame])) {
        return nil;
    }

    self.color = [NSColor greenColor];

    return self;
}

#pragma mark NSView

- (void)drawRect:(NSRect)dirtyRect;
{
    [super drawRect:dirtyRect];

    NSArray *data = [dataSource pointsInScatterPlotView:self];

    if ([data count]) {
        [self.color setStroke];
        
        NSBezierPath *graph = [NSBezierPath bezierPath];

        for (NSValue *dataPointValue in data) {
            NSPoint dataPoint = [dataPointValue pointValue];
            if (dataPoint.x <= 0.0f || dataPoint.x > [self frame].size.width || dataPoint.y <= 0.0f || dataPoint.y > [self frame].size.height) {
                continue;
            }
            NSRect pointRect = NSMakeRect(dataPoint.x - 1.0f, dataPoint.y - 1.0f, 2.0f, 2.0f);
            [graph appendBezierPathWithRect:pointRect];
        }

        [graph stroke];        
    }
}

@end
