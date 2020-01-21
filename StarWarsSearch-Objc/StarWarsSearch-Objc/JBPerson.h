//
//  JBPerson.h
//  StarWarsSearch-Objc
//
//  Created by Jon Bash on 2020-01-21.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JBPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface JBPerson : NSObject

@property NSString *name;
@property NSString *birthYear;
@property NSString *height;
@property NSString *eyeColor;

// Parsing from JSON
// 1. Create initializer that can setup object from NSDictionary
// 2. Pull out data from dictionary

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(instancetype)initWithName:(NSString *)name
                  birthYear:(NSString *)birthYear
                     height:(NSString *)height
                   eyeColor:(NSString *)eyeColor;

@end

NS_ASSUME_NONNULL_END
