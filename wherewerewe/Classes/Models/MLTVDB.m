//
//  MLTVDB.m
//  wherewerewe
//
//  Created by Mark Scholtz on 2011/11/16.
//  Copyright (c) 2011 Unboxed Consulting. All rights reserved.
//

#import "MLTVDB.h"
#import "constants.h"

@interface MLTVDB()

- (NSString *)searchUrlForTerm:(NSString *)term;
- (void)handleResponse:(LRRestyResponse *)response;
- (NSArray *)parseResponse:(LRRestyResponse *)response;
    
@end

@implementation MLTVDB

@synthesize delegate;
@synthesize searchResults;

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
    self.searchResults = nil;
    [super dealloc];
}

- (void)search:(NSString *)term
{
    [[LRResty client] get:[self searchUrlForTerm: term] withBlock:^(LRRestyResponse *response) {
        [self handleResponse:response];
    }];
}

- (NSString *)searchUrlForTerm:(NSString *)term
{
    return [NSString stringWithFormat:@"%@%@", TVDB_SERIES_SEARCH_URL, term];
}

- (void)handleResponse:(LRRestyResponse *)response
{
    self.searchResults = [self parseResponse:response];
    [self.delegate searchDidEnd];
}

- (NSArray *)parseResponse:(LRRestyResponse *)response
{
    RXMLElement *rxml = [RXMLElement elementFromXMLString:[response asString]];
    
    NSMutableArray *results = [[NSMutableArray alloc] init];
    
    [rxml iterate:@"Series" with: ^(RXMLElement *series) {
        [results addObject:[[series child:@"SeriesName"] text]];
    }];

    return [results autorelease];
}

@end