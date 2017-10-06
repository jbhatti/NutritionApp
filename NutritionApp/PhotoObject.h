//
//  PhotoObject.h
//  NutritionApp
//
//  Created by Jaison Bhatti on 2017-10-05.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

@import UIKit;

@interface PhotoObject : NSObject

- (instancetype) initWithName:(NSString *)name andCategory:(NSString *)category andDescription:(NSString*)photoDescription;
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic) NSString * category;
@property (nonatomic) NSString * photoDescription;



@end
