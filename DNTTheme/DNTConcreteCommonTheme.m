//
//  DNTConcreteCommonTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 25/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTConcreteCommonTheme.h"

// Concrete classes
#import "DNTConcreteTextLabelTheme.h"
#import "DNTConcreteDetailedTextLabelTheme.h"

@interface DNTConcreteCommonTheme ( /* Private */ )

@end

@implementation DNTConcreteCommonTheme

#pragma mark - Theme Classes

- (Class)classForThemeWithKey:(NSInteger)key {
    Class class = [super classForThemeWithKey:key];
    
    switch (key) {

            // Text
        case DNTTextFooterElementKey:
        case DNTTextHeaderElementKey:
        case DNTTextBodyElementKey:
        case DNTTextLabelElementKey:
            class = [DNTConcreteTextLabelTheme class];
            break;

        case DNTSecondaryTextElementKey:
            class = [DNTConcreteDetailedTextLabelTheme class];
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

#pragma mark - DNTComponentTheme

- (id <DNTLabelTheme>)textLabelTheme {
    return [self labelThemeForElement:DNTTextLabelElementKey];
}

- (id <DNTLabelTheme>)detailedTextLabelTheme {
    return [self labelThemeForElement:DNTSecondaryTextElementKey];
}

#pragma mark - DNTMainTheme

- (id <DNTComponentTheme>)themeForComponent:(const NSString *)componentName {
    id <DNTComponentTheme> theme = [self.cache objectForKey:componentName];
    NSAssert(theme, @"No theme is registered for component with name: %@", componentName);
    return theme;
}

- (id <DNTComponentTheme>)loadThemeForComponent:(const NSString *)componentName {
    
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

+ (id <DNTLabelTheme>)textLabelTheme {
    return [[self sharedTheme] textLabelTheme];
}

+ (id <DNTLabelTheme>)detailedTextLabelTheme {
    return [[self sharedTheme] detailedTextLabelTheme];
}

/**
 * @abstract
 * Accesses the theme object for a given component.
 *
 * @warning
 * Throws and exception if the no theme is registered for the
 * component.
 */
+ (id <DNTComponentTheme>)themeForComponent:(const NSString *)componentName {
    return [[self sharedTheme] themeForComponent:componentName];
}


@end
