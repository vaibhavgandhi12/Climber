//
//  AllClassesCell.m
//  Climber
//
//  Created by Student on 2/1/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "AllClassesCell.h"

@implementation AllClassesCell

@synthesize image, course_name, total_lessons, total_time, description, publisher;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        image = [[UIImageView alloc] initWithFrame:CGRectMake(5.0, 5.0, 65.0, 65.0)];
        [self addSubview:image];
        
        publisher = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 70.0, 60.0, 20.0)];
        UIFont *font = [UIFont fontWithName:@"AvenirLTPro-Medium" size:12];
        publisher.textAlignment = NSTextAlignmentCenter;
        publisher.font = font;
        [self addSubview:publisher];
        
        course_name = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 0.0, 230.0, 20.0)];
        font = [UIFont fontWithName:@"AvenirLTPro-Heavy" size:16];
        course_name.font = font;
        [self addSubview:course_name];
        
        total_lessons = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 22.0, 70.0, 14.0)];
        font = [UIFont fontWithName:@"AvenirLTPro-Medium" size:12];
        total_lessons.font = font;
        [self addSubview:total_lessons];
        
        total_time = [[UILabel alloc] initWithFrame:CGRectMake(150.0, 22.0, 100.0, 14.0)];
        font = [UIFont fontWithName:@"AvenirLTPro-Medium" size:12];
        total_time.font = font;
        [self addSubview:total_time];
        
        description = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 37.0, 210.0, 90.0)];
        font = [UIFont fontWithName:@"AvenirLTPro-Light" size:14];
        description.font = font;
        description.numberOfLines = -1;
        [self addSubview:description];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
