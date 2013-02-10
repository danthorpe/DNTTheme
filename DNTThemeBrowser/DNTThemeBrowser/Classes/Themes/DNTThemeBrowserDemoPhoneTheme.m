//
//  DNTThemeBrowserDemoPhoneTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 27/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeBrowserDemoPhoneTheme.h"

@implementation DNTThemeBrowserDemoPhoneTheme


- (NSArray *)resourcePathsForThemeWithKey:(NSInteger)key {
    NSArray *resources = nil;
    switch (key) {

            // Text
        case DNTTextFooterElementKey:
        case DNTTextHeaderElementKey:
        case DNTTextBodyElementKey:
            resources = @[ @"text_theme" ];
            break;
        case DNTTextLabelElementKey:
            resources = @[ @"text_theme", @"text_label_theme" ];
            break;
        case DNTDetailedTextLabelElementKey:
            resources = @[ @"text_theme", @"detailed_text_label_theme" ];
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

- (NSString *)prefixForComponent:(const NSString *)componentName {
    return @"feature";
}

@end
