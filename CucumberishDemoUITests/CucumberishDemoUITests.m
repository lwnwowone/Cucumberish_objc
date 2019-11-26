#import <XCTest/XCTest.h>
#import <Cucumberish/Cucumberish.h>

@interface CucumberishDemoUITests : XCTestCase

@end

@implementation CucumberishDemoUITests

@end

__attribute__((constructor))
void CucumberishInit()
{
    XCUIApplication *app = [XCUIApplication new];
    
    //Given A clean demo app
    Given(@"A clean demo app", ^(NSArray<NSString *> *args, NSDictionary *userInfo) {
        [app launch];
    });
    
    //Then I should see value of label "lb_info" is "0"
    Then(@"I should see value of label \"(.*)\" is \"(.*)\"", ^(NSArray<NSString *> *args, NSDictionary *userInfo) {
        NSString *keyOfTergetLabel = args[0];
        XCUIElement *lbInfo = app.staticTexts[keyOfTergetLabel];
        NSString *contentOfLabel = lbInfo.label;
        CCIAssert([contentOfLabel isEqualToString:args[1]], @"value is not %@!", args[1]);
    });
    
    //When Tap button "Action"
    When(@"Tap button \"(.*)\"", ^(NSArray<NSString *> *args, NSDictionary *userInfo) {
        NSString *keyOfTergetButton = args[0];
        XCUIElement *btnAction = app.buttons[keyOfTergetButton];
        [btnAction tap];
    });
    
    //Then I should see value of label "lb_info" is "0"
    //    Then(@"I should see value of label \"(.*)\" is \"(.*)\"", ^(NSArray<NSString *> *args, NSDictionary *userInfo) {
    //
    //    });
    
    NSBundle * bundle = [NSBundle bundleForClass:[CucumberishDemoUITests class]];
    
    [Cucumberish executeFeaturesInDirectory:@"Features" fromBundle:bundle includeTags:@[@"run"] excludeTags:@[@"skip"]];
}
