//
//  AllClassesCell.h
//  Climber
//
//  Created by Student on 2/1/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllClassesCell : UITableViewCell

@property (strong, nonatomic) UIImageView *image;
@property (strong, nonatomic) UILabel *course_name;
@property (strong, nonatomic) UILabel *total_lessons;
@property (strong, nonatomic) UILabel *total_time;
@property (strong, nonatomic) UILabel *description;
@property (strong, nonatomic) UILabel *publisher;

@end
