//
//  SPView.h
//  SimplePlot
//
//  Created by Sam Wen on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SPView : NSView {
    BOOL drawBackground;
    BOOL drawBorder;
}

@property (nonatomic, assign) BOOL drawBackground;
@property (nonatomic, assign) BOOL drawBorder;

@end
