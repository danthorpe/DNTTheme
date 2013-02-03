//
//  DNTThemeBrowserDemoPadTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 27/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeBrowserDemoPadTheme.h"

@implementation DNTThemeBrowserDemoPadTheme

- (NSArray *)resourcePathsForThemeWithKey:(NSInteger)key {
    NSArray *resources = nil;
    switch (key) {

        // Text
        case DNTTextFooterElementKey:
        case DNTTextHeaderElementKey:
        case DNTTextBodyElementKey:
            resources = @[ @"text_theme~ipad" ];
            break;
        case DNTTextLabelElementKey:
            resources = @[ @"text_theme~ipad", @"text_label_theme~ipad" ];
            break;
        case DNTDetailedTextLabelElementKey:
            resources = @[ @"text_theme~ipad", @"detailed_text_label_theme~ipad" ];
            break;

        // Buttons
        case DNTButtonPrimaryElementKey:
        case DNTButtonSecondaryElementKey:
        case DNTButtonTertiaryElementKey:
            break;

        // Navigation items
        case DNTNavigationBarElementKey:
            resources = @[ @"navigation_theme" ];
            break;

        default:
            break;
    }
    
    return resources;
}

@end
