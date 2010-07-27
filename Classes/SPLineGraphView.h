//
//  SPLinePlotView.h
//  SimplePlot
//
//  Created by Sam Wen on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SPCartesianPlotView.h"


@protocol SPLineGraphViewDataSource;


@interface SPLineGraphView : SPCartesianPlotView {
    id <SPLineGraphViewDataSource> dataSource;

    BOOL downSampleGraphToFrame;
}

@property (nonatomic, assign) IBOutlet id <SPLineGraphViewDataSource> dataSource;
@property (nonatomic, assign) BOOL downSampleGraphToFrame;

@end


@protocol SPLineGraphViewDataSource

- (NSArray *)evenlySpacedMagnitudesInLineGraphView:(SPLineGraphView *)linePlotView;

@end
