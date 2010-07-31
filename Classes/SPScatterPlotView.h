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

    NSColor *color;
}

@property (nonatomic, assign) id <SPScatterPlotDataSource> dataSource;
@property (nonatomic, retain) NSColor *color;

@end


@protocol SPScatterPlotDataSource

- (NSArray *)pointsInScatterPlotView:(SPScatterPlotView *)scatterPlotView;

@end
