//
//  MLDataSource.h
//  wherewerewe
//
//  Created by Mark Scholtz on 2011/11/16.
//  Copyright (c) 2011 Unboxed Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLDataSourceDelegate.h"

@interface MLDataSource : NSObject

@property (nonatomic, retain) id<MLDataSourceDelegate> delegate;
@property (nonatomic, retain) NSArray *shows;

- (id)initWithDelegate:(id<MLDataSourceDelegate>)theDelegate;
- (void)search:(NSString*)text;

@end