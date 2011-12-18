#import "MLTVDB.h"
#import <LRResty/LRResty.h>
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

        it(@"searching for series by name", ^{
            id clientMock = [LRRestyClient mock];
            [[LRResty should] receive:@selector(client) andReturn:clientMock];
            [[clientMock should] receive:@selector(get:withBlock:)];

            [tvdb search:@"Boston Legal"];
        });

    });
    
    context(@"URL creation", ^{
        it(@"should return the search url", ^{
            id tvdb = [[MLTVDB alloc] init];
            [[[tvdb searchUrlForTerm:@"Boston Legal"] should] equal:@"http://www.thetvdb.com/api/GetSeries.php?seriesname=Boston Legal"];
        }); 
    });
    
    context(@"handling the response", ^{
       
        __block MLTVDB *tvdb = nil;
        __block NSString *responseBody;
        __block id response = nil;
        __block id delegate = nil;
        
        beforeEach(^{
            delegate = [KWMock nullMockForProtocol:@protocol(MLTVDBDelegate)];
            tvdb = [[MLTVDB alloc] initWithDelegate:delegate];
            responseBody = @"<?xml version='1.0' encoding='UTF-8' ?>"
            "<Data>"
            "<Series>"
            "<seriesid>74058</seriesid>"
            "<language>en</language>"
            "<SeriesName>Boston Legal</SeriesName>"
            "<banner>graphical/74058-3.jpg</banner>"
            "<Overview>Alan Shore (James Spader) and Denny Crane (William Shatner) lead a phalanx of pricey litigators in a Boston law firm in this series that examines the professional and personal lives of brilliant (and often emotionally stunted) attorneys. For perspective, Brad Chase (Mark Valley) joins the firm to keep an eye on loose-cannon senior partner Crane. Monica Potter, Rhona Mitra and Rene Auberjonois co-star.</Overview>"
            "<FirstAired>2004-10-03</FirstAired>"
            "<IMDB_ID>tt0402711</IMDB_ID>"
            "<zap2it_id>SH672369</zap2it_id>"
            "<id>74058</id>"
            "</Series>"
            "</Data>";

            response = [LRRestyResponse mock];
            [[response should] receive:@selector(asString) andReturn:responseBody];
        });
        
        it(@"should store returned series data", ^{
            NSArray *searchResults = [[NSArray alloc] initWithObjects:@"Boston Legal", nil];
            
            [tvdb handleResponse:response];
            [[[tvdb searchResults] should] containObjectsInArray:searchResults];
        });
        
        it(@"should notify the delegate", ^{
            [[delegate should] receive:@selector(searchDidEnd)];
            [tvdb handleResponse:response];
        });

    });
    
});

SPEC_END