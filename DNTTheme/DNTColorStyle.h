//
//  DNTColorStyle.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 25/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeCommon.h"

/**
 * @abstract
 * Methods which define colors for 
 * various contexts.
 */
@protocol DNTColorStyle <NSObject>

/**
 * @abstract Background Color
 *
 * @discussion
 * Used as a background color to themed UIViews.
 */
- (UIColor *)backgroundColor;

/**
 * @abstract Foreground Color
 *
 * @discussion
 * Used as a foreground color to themed UIViews, 
 * typically the text color of UILabels.
 */
- (UIColor *)foregroundColor;

/**
 * @abstract Highlight Color
 *
 * @discussion
 * Used as a highlighted color to themed UILabels
 * and UIButtons.
 */
- (UIColor *)highlightedColor;


@end
