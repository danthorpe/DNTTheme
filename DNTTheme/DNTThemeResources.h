//
//  DNTThemeResources.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 10/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DNTThemeResources <NSObject>


/**
 * @abstract
 * Return the theme class for an element with a given key.
 */
- (Class)classForThemeWithKey:(NSInteger)key;

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
- (NSArray *)resourcePathsForThemeWithKey:(NSInteger)key;

/**
 * @abstract
 * Prefix string for component theme.
 */
- (NSString *)prefixForComponent:(const NSString *)componentName;

@end
