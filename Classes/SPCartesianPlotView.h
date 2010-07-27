//
//  SPCartesianPlotView.h
//  SimplePlot
//
//  Created by Sam Wen on 7/27/10.
//  Copyright 2010 Square. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SPView.h"


@interface SPCartesianPlotView : SPView {
    BOOL drawXAxis;
    NSColor *xAxisColor;
    BOOL drawXTickMarks;
    NSColor *xTickMarksColor;
    CGFloat yMaxValue;
    CGFloat yMinValue;
}

@property (nonatomic, assign) BOOL drawXAxis;
@property (nonatomic, retain) NSColor *xAxisColor;
@property (nonatomic, assign) BOOL drawXTickMarks;
@property (nonatomic, retain) NSColor *xTickMarksColor;
@property (nonatomic, assign) CGFloat yMaxValue;
@property (nonatomic, assign) CGFloat yMinValue;

@end
