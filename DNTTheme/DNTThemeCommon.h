//
//  DNTThemeCommon.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 26/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#ifndef DNTThemeBrowser_DNTThemeCommon_h
#define DNTThemeBrowser_DNTThemeCommon_h

typedef NS_ENUM(NSUInteger, DNTTextElementKeys) {
    DNTTextBodyElementKey,
    DNTTextHeaderElementKey,
    DNTTextFooterElementKey,

    DNTTextElementKeysCount
};

typedef NS_ENUM(NSUInteger, DNTButtonElementKeys) {
    DNTButtonPrimaryElementKey = DNTTextElementKeysCount,
    DNTButtonSecondaryElementKey,
    DNTButtonTertiaryElementKey,

    DNTButtonElementKeysCount
};

@protocol DNTColorStyle;
@protocol DNTTextStyle;
@protocol DNTButtonStyleInteface;

@protocol DNTBaseTheme;
@protocol DNTComponentTheme;
@protocol DNTMainTheme;


#endif
