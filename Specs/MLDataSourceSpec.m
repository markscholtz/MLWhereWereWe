#import "MLDataSource.h"
#import "MLDataSourceDelegate.h"
#import "Kiwi.h"

SPEC_BEGIN(MLDataSourceSpec)

describe(@"MLDataSource", ^{

    it(@"can be initialized with a delegate", ^{
        id delegateMock = [KWMock mockForProtocol:@protocol(MLDataSourceDelegate)];
        id dataSource = [[MLDataSource alloc] initWithDelegate:delegateMock];
        [[dataSource should] beKindOfClass:[MLDataSource class]];
        [[[dataSource delegate] should] equal:delegateMock];
    });
    
    context(@"searching", ^{

        __block id dataSource = nil;
        __block id delegateMock = nil;
        
        beforeEach(^{
            delegateMock = [KWMock nullMockForProtocol:@protocol(MLDataSourceDelegate)];
            dataSource = [[MLDataSource alloc] initWithDelegate:delegateMock];
        });

        it(@"notifies delegate when search has completed", ^{
            [[delegateMock should] receive:@selector(searchDidEnd)];
            [dataSource search:@"Fringe"];
        });

        it(@"retrieves matching shows", ^{
            [dataSource search:@"The Office"];
            [[[dataSource shows] shouldNot] beEmpty];
            [[[dataSource shows] should] contain:@"The Office"];
        });

    });
    
});

SPEC_END