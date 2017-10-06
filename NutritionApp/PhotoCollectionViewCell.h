//
//  PhotoCollectionViewCell.h
//  NutritionApp
//
//  Created by Jaison Bhatti on 2017-10-05.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PhotoObject;

@interface PhotoCollectionViewCell : UICollectionViewCell

@property (nonatomic) PhotoObject *photoObject;
@property (weak, nonatomic) IBOutlet UILabel *descriptionText;
@property (weak, nonatomic) IBOutlet UIButton *buttonText;

- (IBAction)buttonTouched:(UIButton *)sender;

@end
