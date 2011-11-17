//
//  MLTVDB.m
//  wherewerewe
//
//  Created by Mark Scholtz on 2011/11/16.
//  Copyright (c) 2011 Unboxed Consulting. All rights reserved.
//

#import "MLTVDB.h"

@implementation MLTVDB

@synthesize delegate;

- (id)initWithDelegate:(id<MLTVDBDelegate>)theDelegate
{
    if (self = [super init]) {
        self.delegate = theDelegate;
    }
    return self;
}

@end
