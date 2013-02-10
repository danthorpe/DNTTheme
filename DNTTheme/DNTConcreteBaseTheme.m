//
//  DNTConcreteBaseTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 26/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTConcreteBaseTheme.h"
#import "DNTThemeCommon.h"
#import "DNTLoadableTheme.h"
#import "DNTThemeImporter.h"

@interface DNTConcreteBaseTheme ( /* Private */ )

@property (nonatomic, readwrite) NSCache *cache;
@property (nonatomic, readwrite) DNTThemeImporter *importer;

@end


@implementation DNTConcreteBaseTheme

- (id)init {
    self = [super init];
    if (self) {
        self.cache = [[NSCache alloc] init];
        self.importer = [[DNTThemeImporter alloc] init];
    }
    return self;
}

#pragma mark - Cache Assess

- (id)cachedThemeForKey:(NSInteger)key {
    id theme = [self.cache objectForKey:@(key)];
    if ( !theme ) {
        theme = [[[self classForThemeWithKey:key] alloc] init];
        if ( [theme conformsToProtocol:@protocol(DNTLoadableTheme)] ) {
            NSArray *resources = [self resourcePathsForThemeWithKey:key];
            if ( resources ) {
                // Configure the theme
                [theme configureWithProperties:[self.importer themePropertiesFromResources:resources] importer:self.importer];
            }
        }
        [self.cache setObject:theme forKey:@(key)];
    }
    NSAssert(theme, @"Unable to create theme for key: %d", key);
    return theme;
}

- (id)theme:(NSArray *)protocols forKey:(NSInteger)key {
    id theme = [self cachedThemeForKey:key];
    for ( Protocol *protocol in protocols ) {
        NSAssert([theme conformsToProtocol:protocol], @"Cached theme: %@ does not conform to the expected protocol: %@", theme, NSStringFromProtocol(protocol));
    }
    return theme;
}

#pragma mark - Theme Classes

- (Class)classForThemeWithKey:(NSInteger)key {
    [NSException raise:NSInternalInconsistencyException format:@"You must implement %@ in your custom subclass: %@", NSStringFromSelector(_cmd), NSStringFromClass([self class])];
    return nil;
}

- (NSArray *)resourcePathsForThemeWithKey:(NSInteger)key {
    [NSException raise:NSInternalInconsistencyException format:@"You must implement %@ in your custom subclass: %@", NSStringFromSelector(_cmd), NSStringFromClass([self class])];
    return nil;
}

- (NSString *)prefixForComponent:(const NSString *)componentName {
    [NSException raise:NSInternalInconsistencyException format:@"You must implement %@ in your custom subclass: %@", NSStringFromSelector(_cmd), NSStringFromClass([self class])];
    return nil;
}

- (void)loadThemeResouces:(id)resource {
    // no-op, but don't throw an exception.
}

#pragma mark - DNTBaseTheme

- (id <DNTLabelTheme>)labelThemeForElement:(DNTTextElementKeys)cacheKey {
    return (id <DNTLabelTheme>)[self theme:@[ @protocol(DNTLabelTheme) ] forKey:cacheKey];
}

- (id <DNTNavigationBarTheme>)navgiationThemeForElement:(DNTNavigationItemsElementKeys)cacheKey {
    return (id <DNTNavigationBarTheme>)[self theme:@[ @protocol(DNTNavigationBarTheme) ] forKey:cacheKey];
}

@end
