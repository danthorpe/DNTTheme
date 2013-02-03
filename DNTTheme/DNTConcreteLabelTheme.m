//
//  DNTConcreteLabelTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 27/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTConcreteLabelTheme.h"

@implementation DNTConcreteLabelTheme

- (void)applyToLabel:(UILabel *)label {
    [self applyFontToLabel:label];
    [self applyTextColorToLabel:label];
    [self applyHighlightedTextColorToLabel:label];
}

- (void)applyFontToLabel:(UILabel *)label {
    label.font = [self font];
}

- (void)applyTextColorToLabel:(UILabel *)label {
    label.textColor = [self foregroundColor];
}

- (void)applyHighlightedTextColorToLabel:(UILabel *)label {
    label.highlightedTextColor = [self highlightedColor];
}

@end
