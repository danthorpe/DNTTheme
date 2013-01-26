//
//  DNTCommonTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 25/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTCommonTheme.h"

// Concrete classes
#import "DNTBodyTextTheme.h"

@interface DNTCommonTheme ( /* Private */ )

@end

@implementation DNTCommonTheme

#pragma mark - Theme Classes

- (Class)classForThemeWithKey:(NSInteger)key {
    Class class = [super classForThemeWithKey:key];
    
    switch (key) {

            // Text
        case DNTTextStyleFooterKey:
        case DNTTextStyleHeaderKey:
        case DNTTextStyleBodyKey:
            class = [DNTBodyTextTheme class];
            break;

            // Buttons            
        case DNTButtonStylePrimaryKey:
        case DNTButtonStyleSecondaryKey:
        case DNTButtonStyleTertiaryKey:

        default:
            break;
    }

    return class;
}


#pragma mark - DNTPlatformThemeInterface

- (id <DNTComponentThemeInterface>)themeForComponent:(const NSString *)componentName {
    id <DNTComponentThemeInterface> theme = [self.cache objectForKey:componentName];
    NSAssert(theme, @"No theme is registered for component with name: %@", componentName);
    return theme;
}

- (id <DNTTextStyleInterface>)textThemeForStyle:(DNTTextStyleKeys)cacheKey {
    return (id <DNTTextStyleInterface>)[self theme:@protocol(DNTTextStyleInterface) forKey:cacheKey];
}

- (id <DNTButtonStyleInteface>)buttonThemeForStyle:(DNTButtonStyleKeys)cacheKey {
    return (id <DNTButtonStyleInteface>)[self theme:@protocol(DNTButtonStyleInteface) forKey:cacheKey];
}

@end

/**
 * @abstract
 * Primary class method interface to theme and styling
 * functionality.
 */
@implementation DNTTheme

/**
 * @abstract
 * Singleton pattern to access the theme object
 * for the platform.
 *
 * @discussion
 * Default implementation just has a single theme.
 * Consumers of this library should subclass DNTTheme and
 * override this method to return custom classes which
 * implement DNTPlatformTheme. It is strongly suggested
 * that you subclass DNTCommonTheme.
 */
+ (id <DNTPlatformThemeInterface>)sharedTheme {
    static id <DNTPlatformThemeInterface> sharedTheme = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Default implementation only has a single theme.
        sharedTheme = [[DNTCommonTheme alloc] init];
    });
    return sharedTheme;
}

#pragma mark - Public API

/**
 * @abstract
 * Accesses the theme object for body text.
 */
+ (id <DNTTextStyleInterface>)bodyTextTheme {
    return [[self sharedTheme] textThemeForStyle:DNTTextStyleBodyKey];
}

/// @abstract Theme object for header text
+ (id <DNTTextStyleInterface>)headerTextTheme {
    return [[self sharedTheme] textThemeForStyle:DNTTextStyleHeaderKey];
}

/// @abstract Theme object for footer text
+ (id <DNTTextStyleInterface>)footerTextTheme {
    return [[self sharedTheme] textThemeForStyle:DNTTextStyleFooterKey];
}

/**
 * @abstract
 * Accesses the theme object for a given component.
 *
 * @warning
 * Throws and exception if the no theme is registered for the
 * component.
 */
+ (id <DNTComponentThemeInterface>)themeForComponent:(const NSString *)componentName {
    return [[self sharedTheme] themeForComponent:componentName];
}


@end
