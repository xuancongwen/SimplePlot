//
//  SPScatterPlotView.h
//  SimplePlot
//
//  Created by Sam Wen on 7/27/10.
//  Copyright 2010 Square. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SPCartesianPlotView.h"


@protocol SPScatterPlotDataSource;


@interface SPScatterPlotView : SPCartesianPlotView {
    id <SPScatterPlotDataSource> dataSource;
}

@property (nonatomic, assign) id <SPScatterPlotDataSource> dataSource;

@end


@protocol SPScatterPlotDataSource

- (NSArray *)pointsInScatterPlotView:(SPScatterPlotView *)scatterPlotView;

@end
