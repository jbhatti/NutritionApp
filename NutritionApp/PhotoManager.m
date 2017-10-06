//
//  PhotoManager.m
//  NutritionApp
//
//  Created by Jaison Bhatti on 2017-10-05.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "PhotoManager.h"
#import "Photo.h"

@interface PhotoManager()
@property (nonatomic, readonly) NSArray <Photo *>* photos;
@end

@implementation PhotoManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        Photo *nutrientCategories = [[Photo alloc] initWithName:@"Categories"];
        
        _photos = @[nutrientCategories];
    }
    return self;
}

- (NSInteger)numberOfSections {
    return self.photos.count;
}

- (NSInteger) numberOfItemsInSection:(NSInteger)section {
    return self.photos[section].photoObjects.count;
}

- (PhotoObject *)photoObjectAtIndexPath:(NSIndexPath *)indexPath {
    return self.photos[indexPath.section].photoObjects[indexPath.item];
}

- (Photo *)photoAtIndexPath:(NSIndexPath *)indexPath {
    return self.photos[indexPath.section];
}

@end
