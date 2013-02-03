//
//  DNTComponentTheme.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 25/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeCommon.h"
#import "DNTBaseTheme.h"

@protocol DNTComponentTheme <DNTBaseTheme>

/// @abstract Theme object for a table cell text label
- (id <DNTLabelTheme>)textLabelTheme;

/// @abstract Theme object for a table cell secondar text label
- (id <DNTLabelTheme>)detailedTextLabelTheme;

/// @abstract Theme object for a UINavigationBar
- (id <DNTNavigationBarTheme>)navigationBarTheme;

@end
