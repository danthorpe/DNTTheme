//
//  DNTConcreteBaseTheme.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 26/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeCommon.h"

#import "DNTBaseTheme.h"
#import "DNTThemeResources.h"

@class DNTThemeImporter;

@interface DNTConcreteBaseTheme : NSObject <DNTBaseTheme, DNTThemeResources>

@property (nonatomic, readonly) NSCache *cache;
@property (nonatomic, readonly) DNTThemeImporter *importer;

/// @abstract Theme Resources & Caches

- (id)cachedThemeForKey:(NSInteger)key;

- (id)theme:(NSArray *)protocols forKey:(NSInteger)key;

- (void)loadThemeResouces:(id)resource;

@end
