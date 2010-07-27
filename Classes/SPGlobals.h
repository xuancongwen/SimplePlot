/*
 *  SPGlobals.h
 *  SimplePlot
 *
 *  Created by Sam Wen on 7/24/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#define SPDealloc(x) if (x) { \
                         [x release]; \
                     } \
                     x = nil;

#define SPFree(x) if (x) { \
                      free(x); \
                  } \
                  x = NULL;
