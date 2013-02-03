//
//  DNTTextTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 25/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTConcreteTextTheme.h"

@interface DNTConcreteTextTheme ( /* Private */ )

@property (nonatomic) UIColor *backgroundColor;
@property (nonatomic) UIColor *foregroundColor;
@property (nonatomic) UIColor *highlightedColor;

@property (nonatomic, getter = isSystemFontSize) BOOL systemFontSize;
@property (nonatomic, getter = isSystemFont) BOOL systemFont;
@property (nonatomic, getter = isBoldSystemFont) BOOL systemBoldFont;
@property (nonatomic, getter = isItalicSystemFont) BOOL systemItalicFont;
@property (nonatomic) CGFloat fontSize;
@property (nonatomic) NSString *fontName;

@end

@implementation DNTConcreteTextTheme

#pragma mark - DNTLoadableTheme

- (void)configureWithProperties:(NSArray *)properties importer:(id <DNTColorStyleImporter, DNTTextStyleImporter>)importer {

    // Get through the property array
    for ( NSDictionary *prop in properties ) {

        // Get the styles that are defined
        NSArray *styles = [prop objectForKey:@"styles"];

        // Iterate over them
        for ( NSString *style in styles ) {

            // Get the style properties
            NSDictionary *styleProperties = [prop objectForKey:style];

            // Import text styles
            if ( [style isEqualToString:@"text"] ) {

                self.systemFontSize = [importer isSystemFontSizeFromTextStyleProperties:styleProperties];
                self.systemFont = [importer isSystemFontFromTextStyleProperties:styleProperties];
                self.systemBoldFont = [importer isBoldSystemFontFromTextStyleProperties:styleProperties];
                self.systemItalicFont = [importer isItalicSystemFontFromTextStyleProperties:styleProperties];

                if ( !self.isSystemFontSize ) {
                    self.fontSize = [importer fontSizeFromTextStyleProperties:styleProperties];
                }
                if ( !self.isSystemFont ) {
                    self.fontName = [importer fontNameFromTextStyleProperties:styleProperties];
                }
            }

            // Import color styles
            else if ( [style isEqualToString:@"color"] ) {
                self.backgroundColor = [importer backgroundColorFromColorStyleProperties:styleProperties];
                self.foregroundColor = [importer foregroundColorFromColorStyleProperties:styleProperties];
                self.highlightedColor = [importer highlightedColorFromColorStyleProperties:styleProperties];
            }
        }
    }
}

#pragma mark - DNTColorThemeInterface

- (UIColor *)backgroundColor {
    return _backgroundColor;
}

- (UIColor *)foregroundColor {
    return _foregroundColor;
}

- (UIColor *)highlightedColor {
    return _highlightedColor;
}

#pragma mark - DNTTextThemeInterface

- (UIFont *)font {
    return [self fontWithSize:[self fontSize]];
}

- (CGFloat)fontSize {
    return self.isSystemFontSize ? [UIFont systemFontSize] : _fontSize;
}

- (UIFont *)fontWithSize:(CGFloat)fontSize {
    if ( self.isBoldSystemFont ) {
        return [UIFont boldSystemFontOfSize:fontSize];
    } else if ( self.isItalicSystemFont ) {
        return [UIFont italicSystemFontOfSize:fontSize];
    } else if ( self.isSystemFont ) {
        return [UIFont systemFontOfSize:fontSize];
    } else {
        return [UIFont fontWithName:self.fontName size:fontSize];
    }
}

@end
