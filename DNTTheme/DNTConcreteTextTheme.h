//
//  DNTTextTheme.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 25/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DNTThemeCommon.h"
#import "DNTLoadableTheme.h"
#import "DNTColorStyle.h"
#import "DNTTextStyle.h"

@interface DNTConcreteTextTheme : NSObject <DNTLoadableTheme, DNTTextStyle, DNTColorStyle>
@end
