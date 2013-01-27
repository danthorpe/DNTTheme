//
//  DNTTextStyle
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 25/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeCommon.h"

/**
 * @abstract
 * Methods which define low level styles 
 * for text.
 */
@protocol DNTTextStyle <NSObject>

/// @abstract Font to use for text.
- (UIFont *)font;

/// @abstract Font size to use for text.
- (CGFloat)fontSize;

/// @abstract Font with given size.
- (UIFont *)fontWithSize:(CGFloat)fontSize;

@end
