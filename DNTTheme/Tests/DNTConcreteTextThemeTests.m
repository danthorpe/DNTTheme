//
//  DNTConcreteTextThemeTests.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 10/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeTestCase.h"

#import "DNTThemeImporter.h"
#import <OCMock/OCMock.h>

@interface DNTConcreteTextThemeTests : DNTThemeTestCase
@property (nonatomic) DNTConcreteTextTheme *concreteTextTheme;
@property (nonatomic) DNTThemeImporter *importer;
@end

@implementation DNTConcreteTextThemeTests

- (void)setUp {
    [super setUp];
    self.concreteTextTheme = [[DNTConcreteTextTheme alloc] init];
    self.importer = [[DNTThemeImporter alloc] init];
}

- (void)tearDown {
    self.concreteTextTheme = nil;
    self.importer = nil;
    [super tearDown];
}

#pragma mark - DNTLoadableTheme

- (void)testThat_configureWithProperties {

    // Use the importer to get the resources
    NSArray *properties = [self.importer themePropertiesFromResources:@[ @"text_theme" ]];

    // Create a mock for the importer
    id mockImporter = [OCMockObject mockForProtocol:@protocol(DNTStyleImporter)];

    NSDictionary *dic = @{ @"size" : @"system",
                           @"name" : @"system" };

    // Setup expectations
    [[mockImporter expect] isSystemFontFromTextStyleProperties:dic];
    [[mockImporter expect] isSystemFontSizeFromTextStyleProperties:dic];
    [[mockImporter expect] isBoldSystemFontFromTextStyleProperties:dic];
    [[mockImporter expect] isItalicSystemFontFromTextStyleProperties:dic];

    [[mockImporter expect] fontSizeFromTextStyleProperties:dic];
    [[mockImporter expect] fontNameFromTextStyleProperties:dic];

    dic = @{ @"background" : @"white",
             @"foreground" : @"black",
             @"highlighted" : @"white" };

    [[mockImporter expect] backgroundColorFromColorStyleProperties:dic];
    [[mockImporter expect] foregroundColorFromColorStyleProperties:dic];
    [[mockImporter expect] highlightedColorFromColorStyleProperties:dic];

    // Execute method under test
    [self.concreteTextTheme configureWithProperties:properties importer:mockImporter];

    // Verify the mock
    [mockImporter verify];
}

@end
