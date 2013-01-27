//
//  DNTBaseTheme.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 26/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeCommon.h"

@protocol DNTBaseTheme <NSObject>

/// @name Vend Themes

- (id <DNTLabelTheme>)labelThemeForElement:(DNTTextElementKeys)cacheKey;

/// @name Resource Loading

/**
 * @abstract
 * An NSString instance for the path to a plist file which
 * contains inforation for the theme.
 *
 * @discussion
 * Check the implementation of this method in each
 * theme class for information about how this plist
 * should be structured.
 */
@optional
- (NSString *)resourcePathForThemeWithKey:(NSInteger)key;

@end
