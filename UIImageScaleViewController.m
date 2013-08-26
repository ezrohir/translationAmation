//
//  UIImageScaleViewController.m
//  Demo_Me
//
//  Created by tangjie on 13-8-26.
//  Copyright (c) 2013年 YX. All rights reserved.
//

#import "UIImageScaleViewController.h"

@interface UIImageScaleViewController ()

@end

@implementation UIImageScaleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    
    [self.scaleImageView.layer setAnchorPoint:CGPointMake(0, 0)];
    self.scaleImageView.layer.position = CGPointMake(0.0, 0.0);
    
    NSLog(@"anchorPoint:%f  %f",self.scaleImageView.layer.anchorPoint.x,self.scaleImageView.layer.anchorPoint.y);
    NSLog(@"position:%f   %f",self.scaleImageView.layer.position.x,self.scaleImageView.layer.position.y);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClicked:(id)sender {
    [UIView animateWithDuration:2.0f animations:^{
        //
        self.scaleImageView.transform = CGAffineTransformMakeScale(2.0 ,2.0);
    } completion:^(BOOL finished) {
        self.scaleImageView.transform = CGAffineTransformIdentity;
    }];
}

- (void)dealloc {
    [_scaleImageView release];
    [super dealloc];
}
@end
