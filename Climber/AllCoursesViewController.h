//
//  AllCoursesViewController.h
//  Climber
//
//  Created by Student on 2/1/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"

@interface AllCoursesViewController : UIViewController <XMLParserDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *dataArray;
    XMLParser *parser;
    UITableView *dataTable;
}

@end
