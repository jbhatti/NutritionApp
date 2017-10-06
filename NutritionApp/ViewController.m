//
//  ViewController.m
//  NutritionApp
//
//  Created by Jaison Bhatti on 2017-10-04.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoManager.h"
#import "NetworkRequest.h"


@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) PhotoManager* manager;
@property (weak, nonatomic) PhotoCollectionViewCell *cell;
@property (nonatomic) UITapGestureRecognizer *tap;
@property (nonatomic) BOOL isFullScreen;
@property (nonatomic) CGRect prevFrame;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NetworkRequest* networkRequest = [[NetworkRequest alloc] init];
    [networkRequest sendRequest:@"205"];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.manager = [[PhotoManager alloc] init];
    self.title = @"Categories";
    [self handleLayout];
    self.cell = [[PhotoCollectionViewCell alloc] init];
    
    self.isFullScreen = false;
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(collectionView:didSelectItemAtIndexPath:)];
    self.tap.delegate = self;
    
}






- (void) handleLayout {
    UICollectionViewFlowLayout * layout= (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    CGFloat halfWidth = self.collectionView.frame.size.width/2;
    layout.itemSize = CGSizeMake(halfWidth, halfWidth);
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.manager numberOfSections];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.manager numberOfItemsInSection:section];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    PhotoObject *photoObject = [self.manager photoObjectAtIndexPath:indexPath];
    cell.photoObject = photoObject;
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 6;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    PhotoCollectionViewCell *photoCell = [collectionView cellForItemAtIndexPath:indexPath];
    if (!self.isFullScreen) {
        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^
        {
            //save previous frame
            self.prevFrame = cell.frame;
            cell.layer.zPosition = 400;
            [cell setFrame:[[UIScreen mainScreen] bounds]];
            photoCell.descriptionText.alpha = 1;
            [photoCell.descriptionText sizeToFit];
            
            
        }
            completion:^(BOOL finished)
        {
            self.isFullScreen = true;
        }];
        return;
    } else {
        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^
        {
            [cell setFrame:self.prevFrame];
            cell.layer.zPosition = -400;
            photoCell.descriptionText.alpha = 0;
            
        }
            completion:^(BOOL finished)
        {
            self.isFullScreen = false;
        }];
        return;
    }
    
}




- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch;
{
    BOOL shouldReceiveTouch = YES;
    
    if (gestureRecognizer == self.tap) {
        shouldReceiveTouch = (touch.view == self.cell);
    }
    return shouldReceiveTouch;
}




@end
