#import "MLTVDBDelegate.h"
#import "Kiwi.h"

SPEC_BEGIN(MLTVDBDelegateSpec)

describe(@"MLTVDBDelegate", ^{
    
    __block id tvdbDelegate = nil;
    
    beforeEach(^{
        tvdbDelegate = [KWMock mockForProtocol:@protocol(MLTVDBDelegate)];
    });
    
    it(@"receives searchDidEnd", ^{
        [[tvdbDelegate should] respondToSelector:@selector(searchDidEnd)];
    });
    
});

SPEC_END