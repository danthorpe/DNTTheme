//
//  DNTConcreteComponentTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 10/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTConcreteComponentTheme.h"

@interface DNTConcreteComponentTheme ( /* Private */ )
@property (nonatomic, readwrite) NSString *prefix;
@property (nonatomic, readwrite) id <DNTMainTheme> mainTheme;
@end

@implementation DNTConcreteComponentTheme

- (id)initWithMainTheme:(id <DNTMainTheme>)mainTheme prefix:(NSString *)prefix {
    self = [super init];
    if (self) {
        self.prefix = prefix;
        self.mainTheme = mainTheme;
    }
    return self;
}

- (NSArray *)resourcePathsForThemeWithKey:(NSInteger)key {

    // Modify the resource paths of the main theme
    NSArray *mainThemeResources = [self.mainTheme resourcePathsForThemeWithKey:key];
    NSMutableArray *resources = [NSMutableArray arrayWithCapacity:mainThemeResources.count];

    // Modify the resources
    for ( NSString *resource in mainThemeResources ) {
        [resources addObject:[NSString stringWithFormat:@"%@_%@", self.prefix, resource]];
    }

    return resources;
}

@end
