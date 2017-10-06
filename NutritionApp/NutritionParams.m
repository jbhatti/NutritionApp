//
//  NutritionParams.m
//  NutritionApp
//
//  Created by Jaison Bhatti on 2017-10-04.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "NutritionParams.h"

@implementation NutritionParams

- (instancetype)initWithInfo:(NSDictionary<NSString *,id> *)info {
    self = [super init];
    if (self) {
        _format = info[@"JSON"];
        _api_key = info[@"RtWIQynemo0Ttb0l6eum1HqU32YycwLbG6abpE1D"];
        _nutrients = info[@"203"];
        _sort = @"c";
        _max = @"10";
    }
    return self;
}


@end
