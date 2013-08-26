//
//  HomeViewViewController.h
//  Demo_Me
//
//  Created by tangjie on 13-8-26.
//  Copyright (c) 2013年 YX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewViewController : UIViewController
- (IBAction)btnClicked:(id)sender;
@property (retain, nonatomic) IBOutlet UIImageView *firstImageView;
@property (retain, nonatomic) IBOutlet UIImageView *secondImageView;
@property (retain, nonatomic) IBOutlet UIImageView *thirdImageView;
@property (retain, nonatomic) IBOutlet UIImageView *fouthImageView;
@property (strong, nonatomic) NSMutableArray *imageViewContainer;
@property (strong, nonatomic) NSArray *imageViweCenterXContainer;

@end
