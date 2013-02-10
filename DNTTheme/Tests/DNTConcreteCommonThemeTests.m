//
//  DNTConcreteCommonThemeTests.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 09/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeTestCase.h"

#import "DNTConcreteCommonTheme.h"
#import "DNTConcreteLabelTheme.h"
#import "DNTConcreteNavigationBarTheme.h"

@interface DNTConcreteCommonThemeTests : DNTThemeTestCase
@property (nonatomic) DNTConcreteCommonTheme *commonTheme;
@end

@implementation DNTConcreteCommonThemeTests

- (void)setUp {
    [super setUp];
    self.commonTheme = [[DNTConcreteCommonTheme alloc] init];
}

- (void)tearDown {
    self.commonTheme = nil;
    [super tearDown];
}

- (void)testThat_classForThemeWithKey_TextLabel {
    Class class = [self.commonTheme classForThemeWithKey:DNTTextLabelElementKey];
    STAssertNotNil(class, @"%@ should return a class for theme with key: %d", NSStringFromClass([self.commonTheme class]), DNTTextLabelElementKey);
    STAssertTrue([[[class alloc] init] isKindOfClass:[DNTConcreteLabelTheme class]], @"%@ should return a %@ class for theme with key: %d", NSStringFromClass([self.commonTheme class]), NSStringFromClass([DNTConcreteLabelTheme class]), DNTTextLabelElementKey);
}

- (void)testThat_classForThemeWithKey_DetailedTextLabel {
    Class class = [self.commonTheme classForThemeWithKey:DNTDetailedTextLabelElementKey];
    STAssertNotNil(class, @"%@ should return a class for theme with key: %d", NSStringFromClass([self.commonTheme class]), DNTDetailedTextLabelElementKey);
    STAssertTrue([[[class alloc] init] isKindOfClass:[DNTConcreteLabelTheme class]], @"%@ should return a %@ class for theme with key: %d", NSStringFromClass([self.commonTheme class]), NSStringFromClass([DNTConcreteLabelTheme class]), DNTDetailedTextLabelElementKey);
}

- (void)testThat_classForThemeWithKey_NavigationBar {
    Class class = [self.commonTheme classForThemeWithKey:DNTNavigationBarElementKey];
    STAssertNotNil(class, @"%@ should return a class for theme with key: %d", NSStringFromClass([self.commonTheme class]), DNTNavigationBarElementKey);
    STAssertTrue([[[class alloc] init] isKindOfClass:[DNTConcreteNavigationBarTheme class]], @"%@ should return a %@ class for theme with key: %d", NSStringFromClass([self.commonTheme class]), NSStringFromClass([DNTConcreteNavigationBarTheme class]), DNTNavigationBarElementKey);
}

- (void)testThat_classForThemeWithKey_returnsNilForUnimplementedThemeElements {
    [self classForThemeWithKeyTest:DNTTextFooterElementKey];
    [self classForThemeWithKeyTest:DNTTextHeaderElementKey];
    [self classForThemeWithKeyTest:DNTTextBodyElementKey];
    [self classForThemeWithKeyTest:DNTButtonPrimaryElementKey];
    [self classForThemeWithKeyTest:DNTButtonSecondaryElementKey];
    [self classForThemeWithKeyTest:DNTButtonTertiaryElementKey];
    [self classForThemeWithKeyTest:DNTThemeElementUnknownKey];
}

#pragma mark - For Subclasses

- (void)testThat_resourcePathsForThemeWithKeyRaisesException {
    STAssertThrows([self.commonTheme resourcePathsForThemeWithKey:0], @"%@ should throw an exception for %@", NSStringFromClass([DNTConcreteBaseTheme class]), NSStringFromSelector(@selector(resourcePathsForThemeWithKey:)));
}

#pragma mark - Helpers

- (void)classForThemeWithKeyTest:(NSInteger)key {
    STAssertNil([self.commonTheme classForThemeWithKey:key], @"%@ should return nil for theme with key: %d", NSStringFromClass([self.commonTheme class]), key);
}

@end
