//
//  DNTConcreteBaseThemeTests.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 09/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeTestCase.h"

#import "DNTConcreteBaseTheme.h"

@interface DNTConcreteBaseThemeTests : DNTThemeTestCase
@property (nonatomic) DNTConcreteBaseTheme *baseTheme;
@end

@implementation DNTConcreteBaseThemeTests

- (void)setUp {
    [super setUp];
    self.baseTheme = [[DNTConcreteBaseTheme alloc] init];
}

- (void)tearDown {
    self.baseTheme = nil;
    [super tearDown];
}

#pragma mark - Init

- (void)testThat_InitCreatesInstance {
    STAssertNotNil(self.baseTheme, @"%@ not initialized", NSStringFromClass([DNTConcreteBaseTheme class]));
}

- (void)testThat_CacheIsInitialized {
    STAssertNotNil(self.baseTheme.cache, @"Cache not created in %@", NSStringFromClass([DNTConcreteBaseTheme class]));
}

- (void)testThat_ThemeImporterIsInitialized {
    STAssertNotNil(self.baseTheme.importer, @"Theme Importer not created in %@", NSStringFromClass([DNTConcreteBaseTheme class]));
}

#pragma mark - For Subclasses

- (void)testThat_classForThemeWithKeyRaisesException {
    STAssertThrows([self.baseTheme classForThemeWithKey:0], @"%@ should throw an exception for %@", NSStringFromClass([DNTConcreteBaseTheme class]), NSStringFromSelector(@selector(classForThemeWithKey:)));
}

- (void)testThat_resourcePathsForThemeWithKeyRaisesException {
    STAssertThrows([self.baseTheme resourcePathsForThemeWithKey:0], @"%@ should throw an exception for %@", NSStringFromClass([DNTConcreteBaseTheme class]), NSStringFromSelector(@selector(resourcePathsForThemeWithKey:)));
}


@end
