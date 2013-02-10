//
//  DNTThemeImporter.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 02/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNTLoadableTheme.h"

extern inline UIColor * UIColorFromRGB(NSInteger rgbValue);

@interface DNTThemeImporter : NSObject <DNTStyleImporter>

- (NSArray *)themePropertiesFromResources:(NSArray *)resource;

@end
