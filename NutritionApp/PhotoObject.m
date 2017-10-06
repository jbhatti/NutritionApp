//
//  PhotoObject.m
//  NutritionApp
//
//  Created by Jaison Bhatti on 2017-10-05.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "PhotoObject.h"

@implementation PhotoObject

- (instancetype)initWithName:(NSString *)name andCategory:(NSString *)category andDescription:(NSString*)photoDescription{
    self = [super init];
    if (self) {
        _image = [UIImage imageNamed:name];
        _category = category;
        _photoDescription = photoDescription;
    }
    return self;
}

@end
