//
//  DNTConcreteComponentTheme.h
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 10/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTConcreteCommonTheme.h"
#import "DNTComponentTheme.h"

@interface DNTConcreteComponentTheme : DNTConcreteCommonTheme <DNTComponentTheme>

@property (nonatomic, readonly) NSString *prefix;
@property (nonatomic, readonly) id <DNTMainTheme> mainTheme;

/**
 * @abstract
 * Initialize the component theme with a prefix string.
 *
 * @discussion
 * The prefix will get pre-pended to resource strings
 * allowing the consumer to separate YAML files into directories
 * for components.
 */
- (id)initWithMainTheme:(id <DNTMainTheme>)mainTheme prefix:(NSString *)prefix;

@end
