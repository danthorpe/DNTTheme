//
//  DNTPlatformThemeInterface.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 25/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeCommon.h"
#import "DNTComponentThemeInterface.h"

@protocol DNTPlatformThemeInterface <DNTComponentThemeInterface>

/// @return an object which implements DNTComponentThemeInterface.
- (id <DNTComponentThemeInterface>)themeForComponent:(const NSString *)componentName;

@end
