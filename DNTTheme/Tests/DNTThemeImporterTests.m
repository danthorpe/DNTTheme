//
//  DNTThemeImporterTests.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 10/02/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeTestCase.h"

#import "DNTThemeImporter.h"
#import <YACYAML/YACYAML.h>

@interface DNTThemeImporter ( /* Test Exposure */ )

@property (nonatomic) NSCache *cache;

- (id)documentForResource:(NSString *)resource;

- (UIColor *)colorForPropertyValue:(id)propertyValue;
- (UIColor *)colorForNumber:(NSNumber *)number;
- (UIColor *)colorForString:(NSString *)string;

@end

@interface DNTThemeImporterTests : DNTThemeTestCase
@property (nonatomic) DNTThemeImporter *importer;
@end

@implementation DNTThemeImporterTests

- (void)setUp {
    [super setUp];
    self.importer = [[DNTThemeImporter alloc] init];
}

- (void)tearDown {
    self.importer = nil;
    [super tearDown];
}

#pragma mark - Init

- (void)testThat_Init {
    STAssertNotNil(self.importer, @"%@ instance should not be nil", NSStringFromClass([DNTThemeImporter class]));
}

- (void)testThat_Cache {
    STAssertNotNil(self.importer.cache, @"%@'s cache should not be nil", NSStringFromClass([DNTThemeImporter class]));
}

#pragma mark - YAML Loading

- (void)testThat_documentForResource_AccessesCache {
    
    // Get the YAML first
    NSString *resource = @"text_theme";
    NSString *path = [[NSBundle mainBundle] pathForResource:resource ofType:@"yml"];
    id doc = [YACYAMLKeyedUnarchiver unarchiveObjectWithFile:path];

    // Set it in the cache    
    [self.importer.cache setObject:doc forKey:resource];

    id cachedDocument = [self.importer documentForResource:resource];

    STAssertEqualObjects(doc, cachedDocument, @"The cached document: %@ should be equal to the original document: %@", cachedDocument, doc);
}

- (void)testThat_documentForResource_FillsCache {
    
    // Get the YAML first
    NSString *resource = @"text_theme";
    NSString *path = [[NSBundle mainBundle] pathForResource:resource ofType:@"yml"];
    id doc = [YACYAMLKeyedUnarchiver unarchiveObjectWithFile:path];

    // Execute the code under test
    id document = [self.importer documentForResource:resource];

    STAssertEqualObjects(doc, document, @"The returned document: %@ should be equal to the original document: %@", document, doc);

    id cachedDocument = [self.importer.cache objectForKey:resource];
    STAssertEqualObjects(doc, cachedDocument, @"The cached document: %@ should be equal to the original document: %@", cachedDocument, doc);
}

#pragma mark - DNTColorStyleImporter

- (void)testThat_colorForNumber {
    
    UIColor *black = [self.importer colorForNumber:@(0x000000)];
    UIColor *white = [self.importer colorForNumber:@(0xFFFFFF)];
    UIColor *red = [self.importer colorForNumber:@(0xFF0000)];
    UIColor *green = [self.importer colorForNumber:@(0x00FF00)];
    UIColor *blue = [self.importer colorForNumber:@(0x0000FF)];

    UIColor *deviceBlack = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:1.f];
    UIColor *deviceRed = [UIColor colorWithRed:1.f green:0.f blue:0.f alpha:1.f];
    UIColor *deviceGreen = [UIColor colorWithRed:0.f green:1.f blue:0.f alpha:1.f];
    UIColor *deviceBlue = [UIColor colorWithRed:0.f green:0.f blue:1.f alpha:1.f];
    UIColor *deviceWhite = [UIColor colorWithRed:1.f green:1.f blue:1.f alpha:1.f];

    STAssertTrue([black isEqual:deviceBlack], @"The color: 0x000000 should equal black.");
    STAssertFalse([black isEqual:deviceWhite], @"The color: 0x000000 should not equal white.");
    STAssertFalse([black isEqual:deviceRed], @"The color: 0x000000 should not equal red.");
    STAssertFalse([black isEqual:deviceGreen], @"The color: 0x000000 should not equal green.");
    STAssertFalse([black isEqual:deviceBlue], @"The color: 0x000000 should not equal blue.");

    STAssertTrue([white isEqual:deviceWhite], @"The color: 0xFFFFFF should equal white.");
    STAssertFalse([white isEqual:deviceBlack], @"The color: 0xFFFFFF should not equal black.");
    STAssertFalse([white isEqual:deviceRed], @"The color: 0xFFFFFF should not equal red.");
    STAssertFalse([white isEqual:deviceGreen], @"The color: 0xFFFFFF should not equal green.");
    STAssertFalse([white isEqual:deviceBlue], @"The color: 0xFFFFFF should not equal blue.");

    STAssertTrue([red isEqual:deviceRed], @"The color: 0xFF0000 should equal red.");
    STAssertFalse([red isEqual:deviceWhite], @"The color: 0xFF0000 should not equal white.");
    STAssertFalse([red isEqual:deviceBlack], @"The color: 0xFF0000 should not equal black.");
    STAssertFalse([red isEqual:deviceGreen], @"The color: 0xFF0000 should not equal green.");
    STAssertFalse([red isEqual:deviceBlue], @"The color: 0xFF0000 should not equal blue.");

    STAssertTrue([green isEqual:deviceGreen], @"The color: 0x00FF00 should equal green.");
    STAssertFalse([green isEqual:deviceWhite], @"The color: 0x00FF00 should not equal white.");
    STAssertFalse([green isEqual:deviceRed], @"The color: 0x00FF00 should not equal red.");
    STAssertFalse([green isEqual:deviceBlack], @"The color: 0x00FF00 should not equal black.");
    STAssertFalse([green isEqual:deviceBlue], @"The color: 0x00FF00 should not equal blue.");

    STAssertTrue([blue isEqual:deviceBlue], @"The color: 0x0000FF should equal blue.");
    STAssertFalse([blue isEqual:deviceWhite], @"The color: 0x0000FF should not equal white.");
    STAssertFalse([blue isEqual:deviceRed], @"The color: 0x0000FF should not equal red.");
    STAssertFalse([blue isEqual:deviceGreen], @"The color: 0x0000FF should not equal green.");
    STAssertFalse([blue isEqual:deviceBlack], @"The color: 0x0000FF should not equal black.");

}

- (void)testThat_colorForString {

    UIColor *deviceBlack = [UIColor blackColor];
    UIColor *deviceRed = [UIColor redColor];
    UIColor *deviceGreen = [UIColor greenColor];
    UIColor *deviceBlue = [UIColor blueColor];
    UIColor *deviceWhite = [UIColor whiteColor];

    UIColor *black = [self.importer colorForString:@"black"];
    UIColor *white = [self.importer colorForString:@"white"];

    STAssertTrue([black isEqual:deviceBlack], @"The color: black should equal black.");
    STAssertFalse([black isEqual:deviceWhite], @"The color: black should not equal white.");
    STAssertFalse([black isEqual:deviceRed], @"The color: black should not equal red.");
    STAssertFalse([black isEqual:deviceGreen], @"The color: black should not equal green.");
    STAssertFalse([black isEqual:deviceBlue], @"The color: black should not equal blue.");

    STAssertTrue([white isEqual:deviceWhite], @"The color: white should equal white.");
    STAssertFalse([white isEqual:deviceBlack], @"The color: white should not equal black.");
    STAssertFalse([white isEqual:deviceRed], @"The color: white should not equal red.");
    STAssertFalse([white isEqual:deviceGreen], @"The color: white should not equal green.");
    STAssertFalse([white isEqual:deviceBlue], @"The color: white should not equal blue.");
}

- (void)testThat_colorForString_ReturnsNilForUnimplementedColors {
    NSArray *colors = @[ @"red", @"green", @"blue", @"gray", @"purple", @"orange", @"yellow", @"violet" ];
    for ( NSString *color in colors ) {
        STAssertNil([self.importer colorForString:color], @"Should return nil for color: %@", color);
    }
}

- (void)testThat_colorForPropertyValue_ThrowsExceptionForUnimplementedColorStrings  {
    NSArray *colors = @[ @"red", @"green", @"blue", @"gray", @"purple", @"orange", @"yellow", @"violet" ];
    for ( NSString *color in colors ) {
        STAssertThrows([self.importer colorForPropertyValue:color], @"Should throw exception for color: %@", color);
    }
}



@end
