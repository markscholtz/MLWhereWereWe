//
//  MLDataSource.m
//  wherewerewe
//
//  Created by Mark Scholtz on 2011/11/16.
//  Copyright (c) 2011 Unboxed Consulting. All rights reserved.
//

#import "MLDataSource.h"

@implementation MLDataSource

@synthesize delegate;
@synthesize shows;

- (id)initWithDelegate:(id<MLDataSourceDelegate>)theDelegate
{
    if (self = [super init]) {
        self.delegate = theDelegate;
    }
    return self;
}

- (void)search:(NSString *)text
{
    self.shows = [[NSArray alloc] initWithObjects:@"The Office", nil];
    [self.delegate searchDidEnd];
}

@end