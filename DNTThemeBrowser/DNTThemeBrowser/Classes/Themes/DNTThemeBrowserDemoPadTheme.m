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
    NSMutableArray *resources = [NSMutableArray array];
    switch (key) {

            // Text
        case DNTTextFooterElementKey:
        case DNTTextHeaderElementKey:
        case DNTTextBodyElementKey:
            [resources addObject:@"text_theme~ipad"];
            break;
        case DNTTextLabelElementKey:
            [resources addObject:@"text_theme~ipad"];
            [resources addObject:@"text_label_theme~ipad"];
            break;
        case DNTDetailedTextLabelElementKey:
            [resources addObject:@"text_theme~ipad"];
            [resources addObject:@"detailed_text_label_theme~ipad"];
            break;

            // Buttons
        case DNTButtonPrimaryElementKey:
        case DNTButtonSecondaryElementKey:
        case DNTButtonTertiaryElementKey:

        default:
            break;
    }
    
    return resources;
}

@end
