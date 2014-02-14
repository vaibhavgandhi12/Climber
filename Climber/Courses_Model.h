//
//  Courses_Model.h
//  Climber
//
//  Created by Student on 2/1/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Courses_Model : NSObject

@property (copy, nonatomic) NSString *course_name;
@property (copy, nonatomic) NSString *description;
@property (copy, nonatomic) NSString *publisher;
@property (copy, nonatomic) NSString *image;
@property (copy, nonatomic) NSString *publisher_youtube_url;
@property (copy, nonatomic) NSString *publisher_url;
@property (copy, nonatomic) NSString *serial;
@property (copy, nonatomic) NSString *lesson_name;
@property (copy, nonatomic) NSString *url;
@property (strong, nonatomic) NSMutableArray *lesson;
@property (copy, nonatomic) NSArray *temp;
@property (copy, nonatomic) NSString *total_lessons;
@property (copy, nonatomic) NSString *total_time;
@property (copy, nonatomic) NSString *time;
@property (copy, nonatomic) NSString *thumbnail_image;

@end
