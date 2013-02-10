//
//  DNTThemeImporter.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 02/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeImporter.h"
#import <YACYAML/YACYAML.h>

inline UIColor * DNTUIColorFromRGB(NSInteger rgbValue) {
    return [UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0
                           green:((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0
                            blue:((CGFloat)(rgbValue & 0xFF))/255.0 alpha:1.0];
}

@interface DNTThemeImporter ( /* Private */ )

@property (nonatomic) NSCache *cache;

@end

@implementation DNTThemeImporter

- (id)init {
    self = [super init];
    if (self) {
        self.cache = [[NSCache alloc] init];
    }
    return self;
}

- (NSArray *)themePropertiesFromResources:(NSArray *)resources {
    NSMutableArray *properties = [NSMutableArray arrayWithCapacity:resources.count];
    for ( NSString *resource in resources ) {

        // Get the document for this resource
        id document = [self documentForResource:resource];

        [properties addObject:document];
    }
    return properties;
}

- (id)documentForResource:(NSString *)resource {

    // Check to see if the resource is in the cache
    id document = [self.cache objectForKey:resource];

    // Get the YAML
    if ( !document ) {
        NSString *path = [[NSBundle mainBundle] pathForResource:resource ofType:@"yml"];
        document = [YACYAMLKeyedUnarchiver unarchiveObjectWithFile:path];
        [self.cache setObject:document forKey:resource];
    }
    return  document;
}

#pragma mark - DNTColorStyleImporter

- (UIColor *)backgroundColorFromColorStyleProperties:(NSDictionary *)properties {
    return [self colorForPropertyValue:[properties objectForKey:@"background"]];
}

- (UIColor *)foregroundColorFromColorStyleProperties:(NSDictionary *)properties {
    return [self colorForPropertyValue:[properties objectForKey:@"foreground"]];
}

- (UIColor *)highlightedColorFromColorStyleProperties:(NSDictionary *)properties {
    return [self colorForPropertyValue:[properties objectForKey:@"highlighted"]];
}

#pragma mark - DNTTextStyleImporter

- (BOOL)isSystemFontFromTextStyleProperties:(NSDictionary *)properties {
    return [(NSString *)[properties objectForKey:@"name"] isEqualToString:@"system"];
}

- (BOOL)isSystemFontSizeFromTextStyleProperties:(NSDictionary *)properties {
    return [(NSString *)[properties objectForKey:@"size"] isEqualToString:@"system"];
}

- (BOOL)isBoldSystemFontFromTextStyleProperties:(NSDictionary *)properties {
    return [(NSString *)[properties objectForKey:@"name"] isEqualToString:@"system-bold"];
}

- (BOOL)isItalicSystemFontFromTextStyleProperties:(NSDictionary *)properties {
    return [(NSString *)[properties objectForKey:@"name"] isEqualToString:@"system-italic"];
}

- (NSString *)fontNameFromTextStyleProperties:(NSDictionary *)properties {
    return [properties objectForKey:@"name"];
}

- (CGFloat)fontSizeFromTextStyleProperties:(NSDictionary *)properties {
    return [[properties objectForKey:@"size"] floatValue];
}

#pragma mark - DNTNavigationElementStyleImporter

- (UIColor *)tintColorForNavigationElementStyleProperties:(NSDictionary *)properties {
    return [self colorForPropertyValue:[properties objectForKey:@"tint"]];
}

#pragma mark - Helpers

- (UIColor *)colorForPropertyValue:(id)propertyValue {
    UIColor *color = nil;

    if ( [propertyValue isKindOfClass:[NSNumber class]] ) {

        color = [self colorForNumber:(NSNumber *)propertyValue];

    } else if ( [propertyValue isKindOfClass:[NSString class]] ) {

        color = [self colorForString:(NSString *)propertyValue];
    }

    if ( propertyValue ) {
        NSAssert(color, @"color was not created from: %@", propertyValue);
    }

    return color;
}

- (UIColor *)colorForNumber:(NSNumber *)number {
    return DNTUIColorFromRGB( [number integerValue] );
}

- (UIColor *)colorForString:(NSString *)string {

    if ( [string isEqualToString:@"white"] ) {

        return [UIColor whiteColor];

    } else if ( [string isEqualToString:@"black"] ) {

        return [UIColor blackColor];
    }

    return nil;
}

@end
