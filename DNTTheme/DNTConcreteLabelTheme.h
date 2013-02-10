//
//  DNTConcreteLabelTheme.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 27/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTConcreteTextTheme.h"
#import "DNTLabelTheme.h"

@interface DNTConcreteLabelTheme : DNTConcreteTextTheme <DNTLabelTheme>

- (void)applyFontToLabel:(UILabel *)label;

- (void)applyTextColorToLabel:(UILabel *)label;

- (void)applyHighlightedTextColorToLabel:(UILabel *)label;

@end
