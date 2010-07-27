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
    BOOL drawXTickMarks;
    CGFloat yMaxValue;
    CGFloat yMinValue;
}

@property (nonatomic, assign) BOOL drawXAxis;
@property (nonatomic, assign) BOOL drawXTickMarks;
@property (nonatomic, assign) CGFloat yMaxValue;
@property (nonatomic, assign) CGFloat yMinValue;

@end
