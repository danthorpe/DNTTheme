//
//  DNTNavigationBarTheme.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 03/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DNTNavigationBarTheme <NSObject>

/// @name UINavigationBar Themeing

/**
 * @abstract
 * Applies the theme a given UINavigationBar
 *
 * @param navigationBar, the UINavigationBar to be styled.
 */
- (void)applyToNavigationBar:(UINavigationBar *)navigationBar;

/**
 * @abstract
 * Uses UIAppearance to apply the theme to all UINavigationBars
 */
- (void)apply;

@end
