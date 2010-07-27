//
//  SPLinePlotView.h
//  SimplePlot
//
//  Created by Sam Wen on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SPView.h"


@protocol SPLineGraphViewDataSource;


@interface SPLineGraphView : SPView {
    id <SPLineGraphViewDataSource> dataSource;

    BOOL drawXAxis;
    BOOL drawXTickMarks;
    BOOL downSampleGraphToFrame;
    CGFloat yMaxValue;
    CGFloat yMinValue;
}

@property (nonatomic, assign) IBOutlet id <SPLineGraphViewDataSource> dataSource;
@property (nonatomic, assign) BOOL drawXAxis;
@property (nonatomic, assign) BOOL drawXTickMarks;
@property (nonatomic, assign) BOOL downSampleGraphToFrame;
@property (nonatomic, assign) CGFloat yMaxValue;
@property (nonatomic, assign) CGFloat yMinValue;

@end


@protocol SPLineGraphViewDataSource

- (NSArray *)evenlySpacedMagnitudesInLineGraphView:(SPLineGraphView *)linePlotView;

@end
