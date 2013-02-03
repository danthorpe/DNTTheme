//
//  DNTConcreteNavigationElementTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 03/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTConcreteNavigationElementTheme.h"

@interface DNTConcreteNavigationElementTheme ( /* Private */ )

@property (nonatomic) UIBarStyle style;
@property (nonatomic) UIColor *tintColor;
@property (nonatomic) NSDictionary *backgroundImages;

@end

@implementation DNTConcreteNavigationElementTheme

#pragma mark - DNTLoadableTheme

- (void)configureWithProperties:(NSArray *)properties importer:(id<DNTStyleImporter>)importer {

    // Get through the property array
    for ( NSDictionary *prop in properties ) {

        // Get the styles that are defined
        NSArray *styles = [prop objectForKey:@"styles"];

        // Iterate over them
        for ( NSString *style in styles ) {

            // Get the style properties
            NSDictionary *styleProperties = [prop objectForKey:style];

            // Import text styles
            if ( [style isEqualToString:@"navigation"] ) {
                self.tintColor = [importer tintColorForNavigationElementStyleProperties:styleProperties];
            }
        }
    }
}

#pragma mark - DNTNavigationElementStyle

- (UIBarStyle)style {
    return _style;
}

- (UIColor *)tintColor {
    return _tintColor;
}

- (UIImage *)backgroundImageForBarMetrics:(UIBarMetrics)barMetrics {
    return [self.backgroundImages objectForKey:@(barMetrics)];
}

@end
