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

/// @abstract a label theme for an element
- (id <DNTLabelTheme>)labelThemeForElement:(DNTTextElementKeys)cacheKey;

/// @abstract a navigation theme for an element
- (id <DNTNavigationBarTheme>)navgiationThemeForElement:(DNTNavigationItemsElementKeys)cacheKey;

@end
