#import "MLTVDB.h"
#import "Kiwi.h"

SPEC_BEGIN(MLTVDBSpec)

describe(@"MLTVDBSpec", ^{
    
    it(@"can be initialised with a delegate", ^{
        id delegateMock = [KWMock mockForProtocol:@protocol(MLTVDBDelegate)];
        id tvdb = [[MLTVDB alloc] initWithDelegate:delegateMock];
        [[tvdb should] beKindOfClass:[MLTVDB class]];
        [[[tvdb delegate] should] equal:delegateMock];
    });
    
    context(@"searching", ^{

        __block id tvdb = nil;

        beforeEach(^{
            tvdb = [[MLTVDB alloc] init];
        });
        
        pending(@"searching for series by name", ^{
//            [tvdb search:@"Boston Legal"];
        });

    });
    
});

SPEC_END