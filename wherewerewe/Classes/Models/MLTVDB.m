//
//  MLTVDB.m
//  wherewerewe
//
//  Created by Mark Scholtz on 2011/11/16.
//  Copyright (c) 2011 Unboxed Consulting. All rights reserved.
//

#import "MLTVDB.h"

@interface MLTVDB()

- (NSMutableArray *)parseResponse:(LRRestyResponse *)response;
    
@end

@implementation MLTVDB

@synthesize delegate;

- (id)initWithDelegate:(id<MLTVDBDelegate>)theDelegate
{
    if (self = [super init]) {
        self.delegate = theDelegate;
    }
    return self;
}

- (void)dealloc
{
    self.delegate = nil;
    [super dealloc];
}

- (void)search:(NSString *)search
{
    [[LRResty client] get:@"http://www.example.com" withBlock:^(LRRestyResponse *response) {
        [self parseResponse:response];
    }];
}

- (NSMutableArray *)parseResponse:(LRRestyResponse *)response
{
    RXMLElement *rxml = [RXMLElement elementFromXMLString:[response asString]];
    
    NSMutableArray *results = [[NSMutableArray alloc] init];
    
    [rxml iterate:@"Series" with: ^(RXMLElement *series) {
        [results addObject:[[series child:@"SeriesName"] text]];
    }];
    
    return [results autorelease];
}

@end