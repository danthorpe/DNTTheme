//
//  DNTThemeBrowserTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 27/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeBrowserTheme.h"
#import "DNTThemeBrowserDemoPadTheme.h"
#import "DNTThemeBrowserDemoPhoneTheme.h"

NSString * const DNTThemeBrowserFeatureComponent = @"DNTThemeBrowserFeatureComponent";

@implementation DNTThemeBrowserTheme

+ (id <DNTMainTheme>)sharedTheme {
    static id <DNTMainTheme> sharedTheme = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Different theme depending on device platform
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            sharedTheme = [[DNTThemeBrowserDemoPhoneTheme alloc] init];
        } else {
            sharedTheme = [[DNTThemeBrowserDemoPadTheme alloc] init];
        }
    });
    return sharedTheme;
}

@end
