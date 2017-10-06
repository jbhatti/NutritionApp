//
//  Photo.m
//  NutritionApp
//
//  Created by Jaison Bhatti on 2017-10-05.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "Photo.h"
#import "PhotoObject.h"

@implementation Photo

-(instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
        [self createPhotos];
    }
    return self;
}

- (void)createPhotos {
    if ([_name isEqualToString:@"Categories"]) {
        [self createPhotosWithName:@"cat"];
    }
}

- (void)createPhotosWithName:(NSString *)name {
    NSMutableArray <PhotoObject *> *temp = [NSMutableArray array];
    NSArray<NSString *>*categories = @[@"Iron",
                                       @"Protein",
                                       @"Fats",
                                       @"Carbohydrates",
                                       @"Fiber",
                                       @"Sugars",
                                       @"Calcium"];
    
    NSArray<NSString *>*photoDescriptions = @[@"Iron is an important component of hemoglobin, the substance in red blood cells that carries oxygen from your lungs to transport it throughout your body. Hemoglobin represents about two-thirds of the body's iron. If you don't have enough iron, your body can't make enough healthy oxygen-carrying red blood cells.",
                                              @"You also use protein to make enzymes, hormones, and other body chemicals. Protein is an important building block of bones, muscles, cartilage, skin, and blood. Along with fat and carbohydrates, protein is a ""macronutrient,"" meaning that the body needs relatively large amounts of it.",
                                              @"Fat helps you absorb vitamins A, D, E, and K, the so-called fat-soluble vitamins. Fat also fills your fat cells and insulates your body to help keep you warm. The fats your body gets from your food give your body essential fatty acids called linoleic and linolenic acid.",
                                              @"Carbohydrates are your body's main source of energy: They help fuel your brain, kidneys, heart, muscles and central nervous system. For instance, fiber is a carbohydrate that aids in digestion, helps you feel full and keeps blood cholesterol levels in check.",
                                              @"Soluble fiber is found in oats, peas, beans, apples, citrus fruits, carrots, barley and psyllium. Insoluble fiber. This type of fiber promotes the movement of material through your digestive system and increases stool bulk, so it can be of benefit to those who struggle with constipation or irregular stools.",
                                              @"Your body does need carbohydrates, which are broken down into sugar in your body. This sugar is essential for your body to create energy to survive. However, it is not necessary to include sugary foods or added sugars in the diet in order for your body to make energy.",
                                              @"Your body needs calcium to build and maintain strong bones. Your heart, muscles and nerves also need calcium to function properly. Some studies suggest that calcium, along with vitamin D, may have benefits beyond bone health: perhaps protecting against cancer, diabetes and high blood pressure."];
    
    for (NSInteger i = 1; i < 8; ++i) {
        NSString *imgName = [NSString stringWithFormat:@"%@%ld.jpg", name, (long)i];
        NSString *category = categories[i % categories.count];
        NSString *photoDescription = photoDescriptions[i % photoDescriptions.count];
        [temp addObject:[[PhotoObject alloc] initWithName:imgName andCategory:category andDescription:photoDescription]];
    }
    _photoObjects = [temp copy];
}

@end
