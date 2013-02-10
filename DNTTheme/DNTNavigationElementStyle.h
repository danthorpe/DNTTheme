//
//  DNTNavigationBarStyle.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 03/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DNTNavigationElementStyle <NSObject>

- (UIBarStyle)style;

- (UIColor *)tintColor;

- (UIImage *)backgroundImageForBarMetrics:(UIBarMetrics)barMetrics;

@end

@protocol DNTNavigationElementStyleImporter <NSObject>

- (UIColor *)tintColorForNavigationElementStyleProperties:(NSDictionary *)properties;

@end
