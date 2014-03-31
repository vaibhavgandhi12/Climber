//
//  DetailedClassCell.m
//  Climber
//
//  Created by Vaibhav Gandhi on 2/2/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "DetailedClassCell.h"

@implementation DetailedClassCell

@synthesize image, course_name, serial, time;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        image = [[UIImageView alloc] initWithFrame:CGRectMake(5.0, 5.0, 65.0, 65.0)];
        [self addSubview:image];
        
        course_name = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 0.0, 220.0, 40.0)];
        UIFont *font = [UIFont fontWithName:@"AvenirLTPro-Medium" size:14];
        course_name.font = font;
        course_name.numberOfLines = -1;
        [self addSubview:course_name];
        
        time = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 45.0, 100.0, 14.0)];
        font = [UIFont fontWithName:@"AvenirLTPro-Medium" size:12];
        time.font = font;
        [self addSubview:time];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
