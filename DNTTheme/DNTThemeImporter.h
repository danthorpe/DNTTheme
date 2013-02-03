//
//  DNTThemeImporter.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 02/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DNTColorStyle.h"
#import "DNTTextStyle.h"

extern inline UIColor * UIColorFromRGB(NSInteger rgbValue);

@interface DNTThemeImporter : NSObject <DNTColorStyleImporter, DNTTextStyleImporter>

- (NSArray *)themePropertiesFromResources:(NSArray *)resource;

@end
