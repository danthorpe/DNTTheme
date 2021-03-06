//
//  DNTConcreteCommonTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 25/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTConcreteCommonTheme.h"

// Concrete classes
#import "DNTConcreteComponentTheme.h"
#import "DNTConcreteLabelTheme.h"
#import "DNTConcreteNavigationBarTheme.h"

@interface DNTConcreteCommonTheme ( /* Private */ )

@end

@implementation DNTConcreteCommonTheme

#pragma mark - Resource Loading

- (NSArray *)resourcePathsForThemeWithKey:(NSInteger)key {

    // Raise an exception because this method should
    // be over-ridden
    [NSException raise:NSInternalInconsistencyException format:@"You must implement %@ in your custom subclass: %@, there is an example here.", NSStringFromSelector(_cmd), NSStringFromClass([self class])];

    NSArray *resources = nil;
    switch (key) {

        // Text
        case DNTTextFooterElementKey:
        case DNTTextHeaderElementKey:
        case DNTTextBodyElementKey:
            resources = @[ @"text_theme" ];
            break;
        case DNTTextLabelElementKey:
            resources = @[ @"text_theme", @"text_label_theme" ];
            break;
        case DNTDetailedTextLabelElementKey:
            resources = @[ @"text_theme", @"detailed_text_label_theme" ];
            break;

        // Buttons
        case DNTButtonPrimaryElementKey:
        case DNTButtonSecondaryElementKey:
        case DNTButtonTertiaryElementKey:

        // Navigation items
        case DNTNavigationBarElementKey:
            resources = @[ @"navigation_theme" ];
            break;

        default:
            break;
    }

    return resources;
}

- (Class)classForThemeWithKey:(NSInteger)key {
    Class class = nil;
    
    switch (key) {

        // Text
        case DNTTextFooterElementKey:
        case DNTTextHeaderElementKey:
        case DNTTextBodyElementKey:
            break;

        case DNTTextLabelElementKey:
        case DNTDetailedTextLabelElementKey:
            class = [DNTConcreteLabelTheme class];
            break;

        // Buttons            
        case DNTButtonPrimaryElementKey:
        case DNTButtonSecondaryElementKey:
        case DNTButtonTertiaryElementKey:
            break;

        // Navigation Items
        case DNTNavigationBarElementKey:
            class = [DNTConcreteNavigationBarTheme class];
            break;

        default:
            break;
    }

    return class;
}

#pragma mark - DNTComponentTheme

- (id <DNTLabelTheme>)textLabelTheme {
    return [self labelThemeForElement:DNTTextLabelElementKey];
}

- (id <DNTLabelTheme>)detailedTextLabelTheme {
    return [self labelThemeForElement:DNTDetailedTextLabelElementKey];
}

- (id <DNTNavigationBarTheme>)navigationBarTheme {
    return [self navgiationThemeForElement:DNTNavigationBarElementKey];
}

#pragma mark - DNTMainTheme

- (void)apply {
    // Apply navigation bar appearance
    [[self navigationBarTheme] apply];
}

- (id <DNTComponentTheme>)themeForComponent:(const NSString *)componentName {

    // Get the component theme out of the cache
    id <DNTComponentTheme> theme = [self.cache objectForKey:componentName];

    if (!theme) {
        theme = [self loadThemeForComponent:componentName];
    }

    NSAssert(theme, @"No theme is registered for component with name: %@", componentName);
    return theme;
}

- (id <DNTComponentTheme>)loadThemeForComponent:(const NSString *)componentName {

    // Get the prefix for this component
    NSString *prefix = [self prefixForComponent:componentName];

    // Create the component theme
    id <DNTComponentTheme> theme = [[DNTConcreteComponentTheme alloc] initWithMainTheme:self prefix:prefix];

    // Store it in the cache
    [self.cache setObject:theme forKey:componentName];

    return theme;
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
 * that you subclass DNTConcreteCommonTheme.
 *
 * This is a case where the singleton pattern is preferred.
 * The theme needs to be available everywhere, all the time
 * and it only ever modifies the appearance of things. 
 * It is never used to coordinate control, or send messages
 * between objects.
 */
+ (id <DNTMainTheme>)sharedTheme {
    static id <DNTMainTheme> sharedTheme = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Default implementation only has a single theme.
        sharedTheme = [[DNTConcreteCommonTheme alloc] init];
    });
    return sharedTheme;
}

#pragma mark - Public API

+ (void)apply {
    [[self sharedTheme] apply];
}

+ (id <DNTLabelTheme>)textLabelTheme {
    return [[self sharedTheme] textLabelTheme];
}

+ (id <DNTLabelTheme>)detailedTextLabelTheme {
    return [[self sharedTheme] detailedTextLabelTheme];
}

+ (id <DNTNavigationBarTheme>)navigationBarTheme {
    return [[self sharedTheme] navigationBarTheme];
}

/**
 * @abstract
 * Accesses the theme object for a given component.
 *
 * @warning
 * Throws an exception if the no theme is registered for the
 * component.
 */
+ (id <DNTComponentTheme>)themeForComponent:(const NSString *)componentName {
    return [[self sharedTheme] themeForComponent:componentName];
}


@end
