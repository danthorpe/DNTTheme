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

@end
