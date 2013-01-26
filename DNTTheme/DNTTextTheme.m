//
//  DNTTextTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 25/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTTextTheme.h"

@implementation DNTTextTheme

#pragma mark - DNTColorThemeInterface

- (UIColor *)backgroundColor {
    return [UIColor whiteColor];
}

- (UIColor *)foregroundColor {
    return [UIColor blackColor];
}

#pragma mark - DNTTextThemeInterface

- (UIFont *)font {
    return [UIFont systemFontOfSize:[self fontSize]];
}

- (CGFloat)fontSize {
    return [UIFont systemFontSize];
}

@end
