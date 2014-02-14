//
//  AllClassesDetailedViewController.h
//  Climber
//
//  Created by Student on 2/1/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "Courses_Model.h"

@interface AllClassesDetailedViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    UILabel *course_name, *description, *publisher, *total_lessons, *total_time;
    UIImageView *image;
    
    NSMutableArray *dataArray;
    UITableView *dataTable;
}

@property (strong, nonatomic) UITableView *dataTable;

- (instancetype) initWithCourse: (Courses_Model *) course;

@end
