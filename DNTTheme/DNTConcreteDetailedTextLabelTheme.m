//
//  DNTConcreteSecondaryTextLabelTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 27/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTConcreteDetailedTextLabelTheme.h"

@implementation DNTConcreteDetailedTextLabelTheme

- (UIColor *)foregroundColor {
    return [UIColor colorWithRed:0.8f green:0.2f blue:0.2f alpha:1.f];
}

- (UIFont *)fontWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Avenir-Light" size:fontSize];
}

#pragma mark - DNTTextStyle

- (CGFloat)fontSize {
    return [UIFont systemFontSize];
}

#pragma mark - DNTColorStyle

- (UIColor *)highlightedColor {
    return [UIColor colorWithRed:0.701 green:0.754 blue:0.912 alpha:1.000];
}

@end
