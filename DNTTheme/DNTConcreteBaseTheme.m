//
//  DNTConcreteBaseTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 26/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTConcreteBaseTheme.h"
#import "DNTThemeCommon.h"

@interface DNTConcreteBaseTheme ( /* Private */ )

@property (nonatomic, readwrite) NSCache *cache;

@end


@implementation DNTConcreteBaseTheme

- (id)init {
    self = [super init];
    if (self) {
        self.cache = [[NSCache alloc] init];
    }
    return self;
}

#pragma mark - Cache Assess

- (id)cachedThemeForKey:(NSInteger)key {
    id theme = [self.cache objectForKey:@(key)];
    if ( !theme ) {
        theme = [[[self classForThemeWithKey:key] alloc] init];
        [self.cache setObject:theme forKey:@(key)];
    }
    NSAssert(theme, @"Unable to create theme for key: %d", key);
    return theme;
}

- (id)theme:(Protocol *)protocol forKey:(NSInteger)key {
    id theme = [self cachedThemeForKey:key];
    NSAssert([theme conformsToProtocol:protocol], @"Cached theme: %@ does not conform to the expected protocol: %@", theme, NSStringFromProtocol(protocol));
    return theme;
}

#pragma mark - Theme Classes

- (Class)classForThemeWithKey:(NSInteger)key {
    Class class = nil;
    switch (key) {

            // Text
        case DNTTextFooterElementKey:
        case DNTTextHeaderElementKey:
        case DNTTextBodyElementKey:
            break;

            // Buttons
        case DNTButtonPrimaryElementKey:
        case DNTButtonSecondaryElementKey:
        case DNTButtonTertiaryElementKey:

        default:
            break;
    }
    
    return class;
}

#pragma mark - DNTBaseTheme

- (id <DNTTextStyle>)textStyleForElement:(DNTTextElementKeys)cacheKey {
    return (id <DNTTextStyle>)[self theme:@protocol(DNTTextStyle) forKey:cacheKey];
}

- (id <DNTButtonStyleInteface>)buttonStyleForElement:(DNTButtonElementKeys)cacheKey {
    return (id <DNTButtonStyleInteface>)[self theme:@protocol(DNTButtonStyleInteface) forKey:cacheKey];
}

@end
