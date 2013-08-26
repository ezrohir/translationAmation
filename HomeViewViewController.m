//
//  HomeViewViewController.m
//  Demo_Me
//
//  Created by tangjie on 13-8-26.
//  Copyright (c) 2013年 YX. All rights reserved.
//

#import "HomeViewViewController.h"
#define SELF_VIEW_WIDTH 1024
@interface HomeViewViewController ()

@end

@implementation HomeViewViewController

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

    [self recordImageViewsInfo];
}

- (void)recordImageViewsInfo
{
    
    self.imageViewContainer = [NSArray arrayWithObjects:self.firstImageView,self.secondImageView,self.thirdImageView,self.fouthImageView, nil];
    
    CGFloat originx1 = self.firstImageView.center.x;
    CGFloat originx2 = self.secondImageView.center.x;
    CGFloat originx3 = self.thirdImageView.center.x;
    CGFloat originx4 = self.fouthImageView.center.x;
    
    self.imageViweCenterXContainer = [NSArray arrayWithObjects:[NSNumber numberWithFloat:originx1],
                                                               [NSNumber numberWithFloat:originx2],
                                                               [NSNumber numberWithFloat:originx3],
                                                               [NSNumber numberWithFloat:originx4],
                                      nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)blockAnimationWithTag:(NSInteger)tag
{
    //计算各个UIImageViwe偏移方向，和距离
    for (int i = 0; i<[self.imageViewContainer count]; i++) {
        CGFloat animationOffSet = [self getImageOffWidthWithImageViewTag:i andReferenceImageViewTag:tag];
        if (animationOffSet!= 0.0f) {
            UIImageView *imageView = [self.imageViewContainer objectAtIndex:i];
            [self imageOffAnimation:imageView andOffSet:animationOffSet];
        }
    }
}

- (CGFloat)getImageOffWidthWithImageViewTag:(NSInteger)currentImageTag andReferenceImageViewTag:(NSInteger)referenceImageTag
{
    CGFloat offSet = 0.0f;
    if (currentImageTag < referenceImageTag) {
        
        UIImageView *imageView = [self.imageViewContainer objectAtIndex:referenceImageTag];
        offSet = -(imageView.frame.origin.x + imageView.bounds.size.width);
        NSLog(@"offSet:%f",offSet);
        return offSet;
    }else if (currentImageTag > referenceImageTag)
    {
        
        UIImageView *imageView = [self.imageViewContainer objectAtIndex:referenceImageTag];
        offSet = self.view.frame.size.width - imageView.frame.origin.x;
        NSLog(@"offSet:%f",offSet);
        return offSet;
        
    }
    return offSet;
}


- (void)imageOffAnimation:(UIView *)animationView andOffSet:(CGFloat)width
{
    [UIView animateWithDuration:1.0f animations:^{
        CGPoint currentCenter = animationView.center;
        CGPoint newCenter = CGPointMake(currentCenter.x+width, currentCenter.y);
        animationView.center = newCenter;
    }];
}

- (IBAction)btnClicked:(id)sender {
    UIButton *button = (UIButton *)sender;
    [self blockAnimationWithTag:[button tag]];
}

- (IBAction)btnRecover:(id)sender {
    for (int i = 0; i<self.imageViewContainer.count; i++) {
        [self customLayOutImageView:i animation:YES];
    }
}

- (void)customLayOutImageView:(NSInteger)imageViewTag animation:(BOOL)animation
{
    UIImageView *imageView = [self.imageViewContainer objectAtIndex:imageViewTag];
    CGFloat imageViewCenterX = [[self.imageViweCenterXContainer objectAtIndex:imageViewTag] floatValue];
    
    if (animation) {
        [UIView animateWithDuration:1.0f animations:^{
            CGPoint currentCenter = imageView.center;
            CGPoint newCenter = CGPointMake(imageViewCenterX, currentCenter.y);
            imageView.center = newCenter;
        }];
    }else{
        CGPoint currentCenter = imageView.center;
        CGPoint newCenter = CGPointMake(imageViewCenterX, currentCenter.y);
        imageView.center = newCenter;
    }
}

- (void)dealloc {
    [_imageViweCenterXContainer release];
    [_imageViewContainer release];
    [_firstImageView release];
    [_secondImageView release];
    [_thirdImageView release];
    [_fouthImageView release];
    [super dealloc];
}
@end
