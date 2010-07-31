//
//  SimplePlotAppDelegate.m
//  SimplePlot
//
//  Created by Sam Wen on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SimplePlotAppDelegate.h"
#import "AudioToolbox/AudioToolbox.h"


@interface SimplePlotAppDelegate ()

@property (nonatomic, retain, readonly) NSArray *rawSignalArray;

@end


@implementation SimplePlotAppDelegate

@synthesize window;
@synthesize lineGraphView;
@synthesize scatterPlotView;

#pragma mark Initialization

- (id)init;
{
    if (!(self = [super init])) {
        return nil;
    }

    rawSignalArray = nil;
    scatterData = nil;

    return self;
}

- (void)dealloc;
{
    SPDealloc(rawSignalArray);
    SPDealloc(scatterData);

    [super dealloc];
}

#pragma mark Accessor/Mutators

- (NSArray *)rawSignalArray;
{
    if (!rawSignalArray) {
        rawSignalArray = [[NSMutableArray alloc] init];

        NSString *filePath = @"/Users/xuwen/Workspace/SimplePlot/Resources/DemoLineGraph.wav";
        CFURLRef audioFileURL = CFURLCreateFromFileSystemRepresentation(NULL, (const UInt8 *)[filePath UTF8String], strlen([filePath UTF8String]), false);

        AudioFileID audioFileID = NULL;
        OSStatus status = noErr;

        status = AudioFileOpenURL(audioFileURL, kAudioFileReadPermission, kAudioFileWAVEType, &audioFileID);
        NSAssert(status == noErr, @"Some shit just went down.", filePath);

        // Load the raw audio data based on the number of bytes of audio data there are
        UInt32 propertyIsWriteable = 0;
        UInt32 propertySize = 0;
        UInt32 bytesRemaining = 0;

        status = AudioFileGetPropertyInfo(audioFileID, kAudioFilePropertyAudioDataByteCount, &propertySize, &propertyIsWriteable);
        NSAssert(status == noErr, @"The wav file '%@' does not contain file size property information.", filePath);

        status = AudioFileGetProperty(audioFileID, kAudioFilePropertyAudioDataByteCount, &propertySize, &bytesRemaining);
        NSAssert(status == noErr, @"The wav file '%@' does not contain file size information.", filePath);

        long rawSignalLength = bytesRemaining / sizeof(short);
        short *rawSignal = (short *)calloc(1, bytesRemaining);
        AudioFileReadBytes(audioFileID, false, 0, &bytesRemaining, rawSignal);

        for (int index = 0; index < rawSignalLength; ++index) {
            [rawSignalArray addObject:[NSNumber numberWithFloat:(CGFloat)rawSignal[index]]];
        }

        // Release audioFileURL
        CFRelease(audioFileURL);
        audioFileURL = NULL;

        // Close the audio file
        AudioFileClose(audioFileID);
        audioFileID = NULL;

        free(rawSignal);
        rawSignal = NULL;
    }

    return rawSignalArray;
}

#pragma mark NSApplicationDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification;
{
    self.lineGraphView.yMaxValue = 32768.0f;
    self.lineGraphView.yMinValue = -32768.0f;
    self.lineGraphView.downSampleGraphToFrame = NO;

    self.scatterPlotView.xMaxValue = [self.scatterPlotView frame].size.width;
    self.scatterPlotView.xMinValue = 0.0f;
    self.scatterPlotView.yMaxValue = 20000.0f;
    self.scatterPlotView.yMinValue = -20000.0f;

    [self.scatterPlotView setNeedsDisplay:YES];
    [self.lineGraphView setNeedsDisplay:YES];
}

#pragma mark SPLineGraphViewDataSource

- (NSArray *)evenlySpacedMagnitudesInLineGraphView:(SPLineGraphView *)linePlotView;
{
    return self.rawSignalArray;
}

#pragma mark SPScatterPlotViewDataSource

- (NSArray *)pointsInScatterPlotView:(SPScatterPlotView *)scatterPlotView;
{
    if (!scatterData) {
        scatterData = [[NSMutableArray alloc] initWithCapacity:0];
        for (long index = 0; index < 10000; ++index) {
            CGFloat xCoord = rand() % 2000;
            CGFloat yCoord = rand() % 400;
            NSPoint point = NSMakePoint(xCoord, yCoord);
            [scatterData addObject:[NSValue valueWithPoint:point]];
        }
    }

    return scatterData;
}

@end
