//
//  DetailedClassCell.h
//  Climber
//
//  Created by Vaibhav Gandhi on 2/2/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedClassCell : UITableViewCell

@property (strong, nonatomic) UIImageView *image;
@property (strong, nonatomic) UILabel *course_name;
@property (strong, nonatomic) UILabel *serial;
@property (strong, nonatomic) UILabel *time;

@end