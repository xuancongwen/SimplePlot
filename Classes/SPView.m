//
//  SPView.m
//  SimplePlot
//
//  Created by Sam Wen on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SPView.h"


@implementation SPView

@synthesize drawBackground;
@synthesize drawBorder;

#pragma mark Initialization

- (id)initWithFrame:(NSRect)frame;
{
    if (!(self = [super initWithFrame:frame])) {
        return nil;
    }

    self.drawBorder = YES;
    self.drawBackground = YES;

    return self;
}

#pragma mark NSView

- (void)drawRect:(NSRect)dirtyRect;
{
    [super drawRect:dirtyRect];

    [NSBezierPath setDefaultLineWidth:1.0f];
    [NSBezierPath setDefaultLineCapStyle:NSRoundLineCapStyle];
    [NSBezierPath setDefaultLineJoinStyle:NSRoundLineJoinStyle];
    [NSBezierPath setDefaultFlatness:5.0f];

    if (self.drawBackground) {
        [[NSColor blackColor] setFill];
        NSBezierPath *path = [NSBezierPath bezierPath];
        [path appendBezierPathWithRoundedRect:dirtyRect xRadius:5.0f yRadius:5.0f];
        [path fill];
    }

    if (self.drawBorder) {
        [[NSColor redColor] setStroke];
        NSBezierPath *path = [NSBezierPath bezierPath];
        [path appendBezierPathWithRoundedRect:dirtyRect xRadius:5.0f yRadius:5.0f];
        [path stroke];
    }
}

@end
