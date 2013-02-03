//
//  DNTMainTheme.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 25/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeCommon.h"
#import "DNTComponentTheme.h"

@protocol DNTMainTheme <DNTComponentTheme>

/// @abstract Apply themes for UIAppearance
- (void)apply;

/// @return an object which implements DNTComponentTheme.
- (id <DNTComponentTheme>)themeForComponent:(const NSString *)componentName;

@end
