//
//  NetworkRequest.m
//  NutritionApp
//
//  Created by Jaison Bhatti on 2017-10-06.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "NetworkRequest.h"

@implementation NetworkRequest

- (NSURLComponents *)searchNutrition:(NSString *)value {
    NSURLComponents *components = [NSURLComponents componentsWithString:@"https://api.nal.usda.gov/ndb/nutrients/"];
    components.query = @"max=10&subset=1&api_key=RtWIQynemo0Ttb0l6eum1HqU32YycwLbG6abpE1D&sort=c&format=json";
    
    NSMutableArray <NSURLQueryItem *>*queryItems = [components.queryItems mutableCopy];
    NSURLQueryItem *tag = [NSURLQueryItem queryItemWithName:@"nutrients" value:value];
    [queryItems addObject:tag];
    components.queryItems = [queryItems copy];
    
    return components;
}

- (void)sendRequest:(NSString *)createURL
{
    /* Configure session, choose between:
     * defaultSessionConfiguration
     * ephemeralSessionConfiguration
     * backgroundSessionConfigurationWithIdentifier:
     And set session-wide properties, such as: HTTPAdditionalHeaders,
     HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
     */
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    /* Create session, and optionally set a NSURLSessionDelegate. */
    NSURLSession* session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    
    /* Create the Request:
     Request (5) (GET https://api.nal.usda.gov/ndb/nutrients/)
     */
    
    
    NSURL *url = [self searchNutrition:createURL].URL;
    /*NSURL* URL = [NSURL URLWithString:@"https://api.nal.usda.gov/ndb/nutrients/"];
     NSDictionary* URLParams = @{
     @"format": @"json",
     @"api_key": @"RtWIQynemo0Ttb0l6eum1HqU32YycwLbG6abpE1D",
     @"nutrients": @"203",
     @"sort": @"c",
     @"max": @"10",
     };
     URL = NSURLByAppendingQueryParameters(URL, URLParams); */
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    
    // Headers
    
    [request addValue:@"BIGipServerndb-pool=1306069770.20480.0000" forHTTPHeaderField:@"Cookie"];
    
    /* Start a new Task */
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil) {
            // Success
            NSLog(@"URL Session Task Succeeded: HTTP %ld", ((NSHTTPURLResponse*)response).statusCode);
        }
        else {
            // Failure
            NSLog(@"URL Session Task Failed: %@", [error localizedDescription]);
        }
        
        NSError *err = nil;
        NSDictionary* result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
        if (err) {
            NSLog(@"Something went wrong parsing JSON: %@", err.localizedDescription);
            abort();
        }
        
        NSMutableArray *getName = [@[] mutableCopy];
        for (NSDictionary *nutrition in [result[@"report"]valueForKeyPath:@"foods.name"]) {
            [getName addObject:nutrition];
        }
        NSLog(@"%@", getName);
        
        NSMutableArray *getValue = [@[] mutableCopy];
        for (NSDictionary *nutrition1 in [result[@"report"][@"foods"] valueForKeyPath:@"nutrients.value"]) {
            [getValue addObject:nutrition1];
        }
        NSLog(@"%@", getValue);
    }];
    
    
    
    [task resume];
    [session finishTasksAndInvalidate];
}

static NSString* NSStringFromQueryParameters(NSDictionary* queryParameters)
{
    NSMutableArray* parts = [NSMutableArray array];
    [queryParameters enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        NSString *part = [NSString stringWithFormat: @"%@=%@",
                          [key stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding],
                          [value stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]
                          ];
        [parts addObject:part];
    }];
    return [parts componentsJoinedByString: @"&"];
}


static NSURL* NSURLByAppendingQueryParameters(NSURL* URL, NSDictionary* queryParameters)
{
    NSString* URLString = [NSString stringWithFormat:@"%@?%@",
                           [URL absoluteString],
                           NSStringFromQueryParameters(queryParameters)
                           ];
    return [NSURL URLWithString:URLString];
}

@end
