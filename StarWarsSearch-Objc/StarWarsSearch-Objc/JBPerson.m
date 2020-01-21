//
//  JBPerson.m
//  StarWarsSearch-Objc
//
//  Created by Jon Bash on 2020-01-21.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "JBPerson.h"

@implementation JBPerson

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = [dictionary objectForKey:@"name"];
    NSString *birthYear = dictionary[@"birth_year"];
    NSString *height = dictionary[@"height"];
    NSString *eyeColor = dictionary[@"eye_color"];

    return [self initWithName:name
                    birthYear:birthYear
                       height:height
                     eyeColor:eyeColor];
}

-(instancetype)initWithName:(NSString *)name
                  birthYear:(NSString *)birthYear
                     height:(NSString *)height
                   eyeColor:(NSString *)eyeColor {
    self = [super init];
    if (self) {
        // use self.name in non-init methods, _name when initializing
        _name = name;
        _birthYear = birthYear;
        _height = height;
        _eyeColor = eyeColor;
    }
    return self;
}

@end
