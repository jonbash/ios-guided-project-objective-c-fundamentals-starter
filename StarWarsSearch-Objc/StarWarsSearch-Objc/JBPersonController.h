//
//  JBPersonController.h
//  StarWarsSearch-Objc
//
//  Created by Jon Bash on 2020-01-21.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JBPerson.h"

@interface JBPersonController : NSObject

-(void)searchForPeopleWithSearchTerm:(NSString *)searchTerm
                          completion:(void (^)(NSArray *people, NSError *error))completion;

@end
