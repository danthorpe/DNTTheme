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

/// @name Theme Loading

- (id <DNTComponentTheme>)loadThemeForComponent:(const NSString *)componentName;

@end

/// @abstract Class method based functionality.
@interface DNTTheme : NSObject

/// @abstract Shared singleton theme object
+ (id <DNTMainTheme>)sharedTheme;

/// @name Main Themes

/// @abstract Theme object for a table cell text label
+ (id <DNTLabelTheme>)textLabelTheme;

/// @abstract Theme object for a table cell secondar text label
+ (id <DNTLabelTheme>)detailedTextLabelTheme;

/// @abstract Theme object for component
+ (id <DNTComponentTheme>)themeForComponent:(const NSString *)componentName;

@end