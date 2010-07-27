//
//  SPView.h
//  SimplePlot
//
//  Created by Sam Wen on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SPView : NSView {
    NSColor *backgroundColor;
    NSColor *borderColor;
    BOOL drawBackground;
    BOOL drawBorder;
}

@property (nonatomic, retain) NSColor *backgroundColor;
@property (nonatomic, retain) NSColor *borderColor;
@property (nonatomic, assign) BOOL drawBackground;
@property (nonatomic, assign) BOOL drawBorder;

@end
