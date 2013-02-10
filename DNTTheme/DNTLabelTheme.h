//
//  DNTLabelTheme.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 27/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DNTLabelTheme <NSObject>

/// @name UILabel Themeing

/**
 * @abstract
 * Applies the theme a given UILabel
 *
 * @discussion
 * This method will set the following attributes:
 * 1. font
 * 2. textColor
 * 3. textAlignment
 *
 * @param label, the UILabel to be styled.
 */
- (void)applyToLabel:(UILabel *)label;

@end
