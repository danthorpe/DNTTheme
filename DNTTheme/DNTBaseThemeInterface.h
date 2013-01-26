//
//  DNTBaseThemeInterface.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 26/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeCommon.h"

@protocol DNTBaseThemeInterface <NSObject>

- (id <DNTTextStyleInterface>)textThemeForStyle:(DNTTextStyleKeys)cacheKey;

- (id <DNTTextStyleInterface>)buttonThemeForStyle:(DNTButtonStyleKeys)cacheKey;

@end
