#import <XCTest/XCTest.h>
#import <Cucumberish/Cucumberish.h>
#import "Game.h"

@interface CucumberishDemoTests : XCTestCase

@end

@implementation CucumberishDemoTests

@end

__attribute__((constructor))
void CucumberishInit()
{
    __block Game *gameInstance = nil;
    __block NSString *tmpResult = nil;
    
    //    //Given It's a game init with 2 and 3
    Given(@"It's a game init with 2 and 3", ^(NSArray<NSString *> *args, NSDictionary *userInfo) {
        gameInstance = [[Game alloc] initWithNumber1:2 number2:3];
    });
    
    //When Input 8
    When(@"Input 8", ^(NSArray<NSString *> *args, NSDictionary *userInfo) {
        tmpResult = [gameInstance resolveInputNumber:8];
    });
    
    //Then I should see Number1
    Then(@"I should see Number1", ^(NSArray<NSString *> *args, NSDictionary *userInfo) {
        CCIAssert([tmpResult isEqualToString:GAME_RESULT_NUMBER1], @"Should get Number1 as result");
    });
    
    //When Input "9" / When Input "6"
    When(@"Input \"(.*)\"", ^(NSArray<NSString *> *args, NSDictionary *userInfo) {
        NSString *inputValue = args[0];
        tmpResult = [gameInstance resolveInputNumber:[inputValue intValue]];
    });
    
    //Then I should see "Number2" / Then I should see "Both"
    Then(@"I should see \"(.*)\"", ^(NSArray<NSString *> *args, NSDictionary *userInfo) {
        CCIAssert([tmpResult isEqualToString:args[0]], @"Should get %@ as result", args[0]);
    });
    
    NSBundle * bundle = [NSBundle bundleForClass:[CucumberishDemoTests class]];
    
    [Cucumberish executeFeaturesInDirectory:@"Features" fromBundle:bundle includeTags:@[@"run"] excludeTags:@[@"skip"]];
}
