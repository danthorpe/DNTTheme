//
//  DNTConcreteCommonTheme.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 25/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DNTConcreteBaseTheme.h"
#import "DNTMainTheme.h"

@protocol DNTColorStyle;
@protocol DNTTextStyle;
@protocol DNTComponentTheme;

@interface DNTConcreteCommonTheme : DNTConcreteBaseTheme <DNTMainTheme>
@end

/// @abstract Class method based functionality.
@interface DNTTheme : NSObject

/// @abstract Shared singleton theme object
+ (id <DNTMainTheme>)sharedTheme;

/// @name Main Themes

/// @abstract Theme object for body text
+ (id <DNTTextStyle>)bodyTextTheme;

/// @abstract Theme object for header text
+ (id <DNTTextStyle>)headerTextTheme;

/// @abstract Theme object for footer text
+ (id <DNTTextStyle>)footerTextTheme;

/// @abstract Theme object for component
+ (id <DNTComponentTheme>)themeForComponent:(const NSString *)componentName;

@end