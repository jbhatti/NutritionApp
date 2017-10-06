//
//  DetailViewController.m
//  NutritionApp
//
//  Created by Jaison Bhatti on 2017-10-05.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "DetailViewController.h"
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>


@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *photos = [NSArray arrayWithObjects:
                        [UIImage imageNamed:@"protein1.jpeg"],
                        [UIImage imageNamed:@"protein2.jpeg"],
                        [UIImage imageNamed:@"protein3.jpeg"],
                        [UIImage imageNamed:@"protein4.jpeg"],
                        [UIImage imageNamed:@"protein5.jpeg"],
                        [UIImage imageNamed:@"protein6.jpeg"],
                        [UIImage imageNamed:@"protein7.jpeg"],
                        [UIImage imageNamed:@"protein8.jpeg"],
                        [UIImage imageNamed:@"protein9.jpeg"],
                        [UIImage imageNamed:@"protein10.jpeg"],
                        nil];
    
    
  // You can customize MDCSwipeToChooseView using   MDCSwipeToChooseViewOptions.
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
     options.likedText = @"Yummy";
     options.likedColor = [UIColor blueColor];
     options.nopeText = @"Yucky";
     options.onPan = ^(MDCPanState *state){
     if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
     NSLog(@"Let go now to delete the photo!");
     }
     };
     
     MDCSwipeToChooseView *view = [[MDCSwipeToChooseView alloc] initWithFrame:self.view.bounds
     options:options];
    
    for (UIImage *image in photos) {
     view.imageView.image = [UIImage imageNamed:@"photo"];
    }
     [self.view addSubview:view];
}



#pragma mark - MDCSwipeToChooseDelegate Callbacks

// This is called when a user didn't fully swipe left or right.
- (void)viewDidCancelSwipe:(UIView *)view {
    NSLog(@"Couldn't decide, huh?");
}

// Sent before a choice is made. Cancel the choice by returning `NO`. Otherwise return `YES`.
- (BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        return YES;
    } else {
        // Snap the view back and cancel the choice.
        [UIView animateWithDuration:0.16 animations:^{
            view.transform = CGAffineTransformIdentity;
            view.center = [view superview].center;
        }];
        return NO;
    }
}

// This is called then a user swipes the view fully left or right.
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        NSLog(@"Photo deleted!");
    } else {
        NSLog(@"Photo saved!");
    }
}


@end
