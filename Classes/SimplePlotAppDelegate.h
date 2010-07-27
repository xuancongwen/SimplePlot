//
//  SimplePlotAppDelegate.h
//  SimplePlot
//
//  Created by Sam Wen on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SimplePlot.h"


@interface SimplePlotAppDelegate : NSObject <NSApplicationDelegate, SPLineGraphViewDataSource> {
    NSWindow *window;
    SPLineGraphView *lineGraphView;

    NSMutableArray *rawSignalArray;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet SPLineGraphView *lineGraphView;

@end
