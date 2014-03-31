//
//  FirstViewController.m
//  Climber
//
//  Created by hds6825 on 2/2/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "FirstViewController.h"
#import "AllCoursesViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

UIDynamicAnimator* _animator;
UIGravityBehavior* _gravity;
UICollisionBehavior* _collision;
int counter = 0;

- (void)viewDidLoad
{
    [super viewDidLoad];
	//Do any additional setup after loading the view.
    
    NSString *path = [[NSBundle mainBundle] pathForResource: @"object" ofType: @"png"];
    UIImage* image = [[UIImage alloc] initWithContentsOfFile: path];
    UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
    imageView.center = CGPointMake(160, 0); //Setting the center of image
    [self.view addSubview: imageView];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[imageView]];
    [_animator addBehavior:_gravity];
    
    
    UIDynamicItemBehavior* itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[imageView]];
    itemBehaviour.elasticity = 0.5;
    [_animator addBehavior:itemBehaviour];
    
    
    _collision = [[UICollisionBehavior alloc] initWithItems:@[imageView]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collision];
    
    [self performSelector:@selector(goToNextView) withObject:nil afterDelay:3];
}

- (void) goToNextView
{
//    AllCoursesViewController *vc = [[AllCoursesViewController alloc] init];
//    [self presentViewController:vc animated:YES completion:nil];
    
    [self performSegueWithIdentifier:@"transitionForView" sender:self];
}

@end
