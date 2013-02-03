//
//  DNTLoadableTheme.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 02/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DNTThemeCommon.h"

@protocol DNTLoadableTheme <NSObject>

/// @name Resource Loading

/**
 * @abstract
 * Configure the theme using the properties provided
 * by this dictionary
 */
- (void)configureWithProperties:(NSArray *)properties importer:(id <DNTColorStyleImporter, DNTTextStyleImporter>)importer;

@end
