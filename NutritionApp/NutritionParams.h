//
//  NutritionParams.h
//  NutritionApp
//
//  Created by Jaison Bhatti on 2017-10-04.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NutritionParams : NSObject

@property (nonatomic, strong) NSString* format;
@property (nonatomic, strong) NSString* api_key;
@property (nonatomic, strong) NSString* nutrients;
@property (nonatomic, strong) NSString* sort;
@property (nonatomic, strong) NSString* max;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* value;


- (instancetype)initWithInfo:(NSDictionary<NSString*,id>*)info;



//self.name

//queryrequest:.............parameter:name:completionblock:{
//"www.nutrientsquery"

//w4d2

///
@end
