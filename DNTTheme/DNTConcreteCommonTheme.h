//
//  DNTConcreteCommonTheme.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 25/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DNTConcreteBaseTheme.h"
#import "DNTPlatformThemeInterface.h"

@protocol DNTColorStyleInterface;
@protocol DNTTextStyleInterface;
@protocol DNTComponentThemeInterface;

@interface DNTConcreteCommonTheme : DNTConcreteBaseTheme <DNTPlatformThemeInterface>
@end

/// @abstract Class method based functionality.
@interface DNTTheme : NSObject

/// @abstract Shared singleton theme object
+ (id <DNTPlatformThemeInterface>)sharedTheme;

/// @name Main Themes

/// @abstract Theme object for body text
+ (id <DNTTextStyleInterface>)bodyTextTheme;

/// @abstract Theme object for header text
+ (id <DNTTextStyleInterface>)headerTextTheme;

/// @abstract Theme object for footer text
+ (id <DNTTextStyleInterface>)footerTextTheme;

/// @abstract Theme object for component
+ (id <DNTComponentThemeInterface>)themeForComponent:(const NSString *)componentName;

@end