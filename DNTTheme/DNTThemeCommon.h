//
//  DNTThemeCommon.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 26/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#ifndef DNTThemeBrowser_DNTThemeCommon_h
#define DNTThemeBrowser_DNTThemeCommon_h

typedef NS_ENUM(NSUInteger, DNTThemeElementKeys) {
    DNTThemeElementUnknownKey = 0
};

typedef NS_ENUM(NSUInteger, DNTTextElementKeys) {
    DNTTextBodyElementKey = DNTThemeElementUnknownKey,
    DNTTextHeaderElementKey,
    DNTTextFooterElementKey,
    DNTTextLabelElementKey,
    DNTDetailedTextLabelElementKey,

    DNTTextElementKeysCount
};

typedef NS_ENUM(NSUInteger, DNTButtonElementKeys) {
    DNTButtonPrimaryElementKey = DNTTextElementKeysCount,
    DNTButtonSecondaryElementKey,
    DNTButtonTertiaryElementKey,

    DNTButtonElementKeysCount
};

typedef NS_ENUM(NSUInteger, DNTNavigationItemsElementKeys) {
    DNTNavigationBarElementKey = DNTButtonElementKeysCount,

    DNTNavigationItemsElementKeysCount
};

// Themes
@protocol DNTColorStyle;
@protocol DNTTextStyle;
@protocol DNTNavigationElementStyle;
@protocol DNTButtonStyleInteface;

// Importers
@protocol DNTColorStyleImporter;
@protocol DNTTextStyleImporter;

// Themes
@protocol DNTBaseTheme;
@protocol DNTLoadableTheme;
@protocol DNTComponentTheme;
@protocol DNTMainTheme;
@protocol DNTLabelTheme;
@protocol DNTNavigationBarTheme;


#endif
