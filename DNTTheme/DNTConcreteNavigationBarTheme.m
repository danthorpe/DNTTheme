//
//  DNTConcreteNavigationBarTheme.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 03/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTConcreteNavigationBarTheme.h"

@implementation DNTConcreteNavigationBarTheme

#pragma mark - DNTNavigationBarTheme

- (void)applyToNavigationBar:(UINavigationBar *)navigationBar {
    [self applyTintColor:navigationBar];
}

- (void)apply {
    [[UINavigationBar appearance] setTintColor:[self tintColor]];
    [[UIToolbar appearance] setTintColor:[self tintColor]];
}

#pragma mark - Private

- (void)applyTintColor:(UINavigationBar *)navigationBar {
    [navigationBar setTintColor:[self tintColor]];
}

@end
