//
//  PhotoCollectionViewCell.m
//  NutritionApp
//
//  Created by Jaison Bhatti on 2017-10-05.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "PhotoObject.h"

@interface PhotoCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelText;


@end

@implementation PhotoCollectionViewCell

-(void)setPhotoObject:(PhotoObject *)photoObject {
    self.imageView.image = photoObject.image;
    self.labelText.text = photoObject.category;
    self.descriptionText.text = photoObject.photoDescription;
    _photoObject = photoObject;
}



-(void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    self.descriptionText.alpha = 0;
    self.buttonText.alpha = 1;
}

- (IBAction)buttonTouched:(UIButton *)sender {
    
}
@end
