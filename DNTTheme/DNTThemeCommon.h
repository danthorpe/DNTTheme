//
//  DNTThemeCommon.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 26/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#ifndef DNTThemeBrowser_DNTThemeCommon_h
#define DNTThemeBrowser_DNTThemeCommon_h

typedef NS_ENUM(NSUInteger, DNTTextStyleKeys) {
    DNTTextStyleBodyKey,
    DNTTextStyleHeaderKey,
    DNTTextStyleFooterKey,

    DNTTextStyleKeyCount
};

typedef NS_ENUM(NSUInteger, DNTButtonStyleKeys) {
    DNTButtonStylePrimaryKey = DNTTextStyleKeyCount,
    DNTButtonStyleSecondaryKey,
    DNTButtonStyleTertiaryKey,

    DNTButtonStyleKeyCount
};

@protocol DNTColorStyleInterface;
@protocol DNTTextStyleInterface;
@protocol DNTButtonStyleInteface;

@protocol DNTBaseThemeInterface;
@protocol DNTComponentThemeInterface;
@protocol DNTPlatformThemeInterface;


#endif
