//
//  MLTVDB.h
//  wherewerewe
//
//  Created by Mark Scholtz on 2011/11/16.
//  Copyright (c) 2011 Unboxed Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXMLElement.h"
#import "MLTVDBDelegate.h"

@interface MLTVDB : NSObject

@property (nonatomic, retain) id<MLTVDBDelegate> delegate;

- (id)initWithDelegate:(id<MLTVDBDelegate>)theDelegate;

@end
