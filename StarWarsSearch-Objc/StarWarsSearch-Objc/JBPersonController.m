//
//  JBPersonController.m
//  StarWarsSearch-Objc
//
//  Created by Jon Bash on 2020-01-21.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "JBPersonController.h"
#import "JBPerson.h"

@implementation JBPersonController

static NSString * const baseURLString = @"https://swapi.co/api/people";

-(void)searchForPeopleWithSearchTerm:(NSString *)searchTerm
                          completion:(void (^)(NSArray *people, NSError *error))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"search" value:searchTerm];

    //    [components setPercentEncodedQueryItems:@[searchItem]];
    components.queryItems = @[searchItem];
    NSURL *url = components.URL;
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [[NSURLSession.sharedSession dataTaskWithRequest:request
                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }

        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (jsonError) {
            completion(nil, jsonError);
            return;
        }

        // data is not dictionary, maybe we have an error api json response
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary as expected");
            completion(nil, [[NSError alloc] init]); // TODO: populate error details
            return;
        }

        // create an array of people by decoding the data
        NSLog(@"JSON: %@", dictionary);
        NSArray *personDicts = dictionary[@"results"];
        NSMutableArray *people = [[NSMutableArray alloc] init];
        for (NSDictionary *personDict in personDicts) {
            [people addObject:[[JBPerson alloc] initWithDictionary:personDict]];
        }

        completion(people, nil);
    }] resume];
}

@end
