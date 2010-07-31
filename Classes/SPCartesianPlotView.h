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
    BOOL drawYAxis;
    NSColor *yAxisColor;
    BOOL drawXTickMarks;
    NSColor *xTickMarksColor;
    BOOL drawYTickMarks;
    NSColor *yTickMarksColor;
    CGFloat xMaxValue;
    CGFloat xMinValue;
    CGFloat yMaxValue;
    CGFloat yMinValue;
}

@property (nonatomic, assign) BOOL drawXAxis;
@property (nonatomic, retain) NSColor *xAxisColor;
@property (nonatomic, assign) BOOL drawYAxis;
@property (nonatomic, retain) NSColor *yAxisColor;
@property (nonatomic, assign) BOOL drawXTickMarks;
@property (nonatomic, retain) NSColor *xTickMarksColor;
@property (nonatomic, assign) BOOL drawYTickMarks;
@property (nonatomic, retain) NSColor *yTickMarksColor;
@property (nonatomic, assign) CGFloat xMaxValue;
@property (nonatomic, assign) CGFloat xMinValue;
@property (nonatomic, assign) CGFloat yMaxValue;
@property (nonatomic, assign) CGFloat yMinValue;

@end
