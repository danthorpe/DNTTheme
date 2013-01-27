//
//  DNTConcreteBaseTheme.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 26/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeCommon.h"
#import "DNTBaseTheme.h"

@interface DNTConcreteBaseTheme : NSObject <DNTBaseTheme>

@property (nonatomic, readonly) NSCache *cache;

/// @abstract Theme Cache

- (id)cachedThemeForKey:(NSInteger)key;

- (id)theme:(Protocol *)protocol forKey:(NSInteger)key;

- (Class)classForThemeWithKey:(NSInteger)key;

@end
