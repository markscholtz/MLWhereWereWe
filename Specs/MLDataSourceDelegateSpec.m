#import "MLDataSourceDelegate.h"
#import "Kiwi.h"

SPEC_BEGIN(MLDataSourceDelegateSpec)

describe(@"MLDataSourceDelegate", ^{

    __block id dataSourceDelegate = nil;
    
    beforeEach(^{
        dataSourceDelegate = [KWMock mockForProtocol:@protocol(MLDataSourceDelegate)];
    });

    it(@"receives searchDidEnd", ^{
        [[dataSourceDelegate should] respondToSelector:@selector(searchDidEnd)];
    });

});

SPEC_END