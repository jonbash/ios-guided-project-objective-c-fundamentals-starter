//
//  JBPersonTests.m
//  StarWarsSearch-ObjcTests
//
//  Created by Paul Solt on 11/5/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JBPerson.h"
#import "LSIFileHelper.h"

@interface JBPersonTests : XCTestCase

@end

@implementation JBPersonTests

- (void)testParsePersonJSON {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSData *data = jbLoadFile(@"Person.json", bundle);
    XCTAssertNotNil(data);
    NSError *error = nil;
    // Bitmask = flags in C/Objective-C
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        // @"Hello" = Objective-C String
        // "World" = C string (C Programming Language)
        XCTFail(@"Error: %@", error);  // String tokens: %@ = object
    }
    NSLog(@"PERSON: %@", json);
    // JSON -> LSIPerson
    JBPerson *luke = [[JBPerson alloc] initWithDictionary:json];
    //    XCTAssertEqual() is for int, double, float, and primitive data types
    // XCTAssertEqualObjects() for NSString, and other objects
    NSString *name = @"Luke Skywalker";
    XCTAssertEqualObjects(name, luke.name);
    XCTAssertEqualObjects(@"19BBY", luke.birthYear);
    XCTAssertEqualObjects(@"172", luke.height);
    XCTAssertEqualObjects(@"blue", luke.eyeColor);
}

@end
