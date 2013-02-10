//
//  DNTConcreteBaseTheme.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 26/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeCommon.h"
#import "DNTBaseTheme.h"

@class DNTThemeImporter;

@interface DNTConcreteBaseTheme : NSObject <DNTBaseTheme>

@property (nonatomic, readonly) NSCache *cache;
@property (nonatomic, readonly) DNTThemeImporter *importer;

/// @abstract Theme Resources & Caches

- (id)cachedThemeForKey:(NSInteger)key;

- (id)theme:(NSArray *)protocols forKey:(NSInteger)key;

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


- (void)loadThemeResouces:(id)resource;

@end
