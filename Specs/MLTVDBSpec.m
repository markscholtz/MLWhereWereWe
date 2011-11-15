#import "MLTVDB.h"
#import "Kiwi.h"

SPEC_BEGIN(MLTVDBSpec)

describe(@"MLTVDBSpec", ^{
    
    it(@"can be initialised", ^{
        id tvdb = [[MLTVDB alloc] init];
        [[tvdb should] beKindOfClass:[MLTVDB class]];
    });
    
    context(@"searching for series by name", ^{
        
    });
    
});

SPEC_END