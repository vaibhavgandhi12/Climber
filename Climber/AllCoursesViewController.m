//
//  AllCoursesViewController.m
//  Climber
//
//  Created by Student on 2/1/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "AllCoursesViewController.h"
#import "AllClassesCell.h"
#import "Courses_Model.h"
#import "AllClassesDetailedViewController.h"

@interface AllCoursesViewController ()

@end

@implementation AllCoursesViewController

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
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.topItem.title = @"Rock Climbing Courseware";
    
    parser = [[XMLParser alloc] init];
    parser.delegate = self;
    dataArray = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(instancetype) init
{
    if([super init])
    {
     
    }
    return self;
}

-(BOOL) shouldAutorotate{
    return NO;
}

-(void) loadTable
{
    dataTable = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 20.0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [dataTable setSeparatorColor:[UIColor clearColor]];
    dataTable.delegate = self;
    dataTable.dataSource = self;
    [self.view addSubview:dataTable];
}

#pragma mark PROTOCOL
-(void) doneParsingWithData:(NSArray *)arr Status:(ParseStatus) status;
{
    UIAlertView *alert;
    switch (status) {
        case PARSE_ERROR:
            //NSLog(@"PARSE_ERROR");
            alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error decoding message from server" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            break;
        case NETWORK_ISSUE:
            //NSLog(@"NETWORK_ISSUE");
            alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error connecting to server" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            break;
        case SUCCESSFUL:
            //NSLog(@"SUCCESSFUL");
            dataArray = [[NSMutableArray alloc] initWithArray:arr];
            [self loadTable];
            break;
        default:
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AllClassesCell *cell;
    static NSString *CellIdentifier = @"Cell";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[AllClassesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Courses_Model *temp = (Courses_Model *)[dataArray objectAtIndex:indexPath.row];
    cell.course_name.text = temp.course_name;
    cell.total_lessons.text = temp.total_lessons;
    cell.total_time.text = temp.total_time;
    cell.description.text = temp.description;
    cell.publisher.text = temp.publisher;
    NSURL *url = [NSURL URLWithString:temp.image];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    cell.image.image = img;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140.0;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AllClassesDetailedViewController *detailedView = [[AllClassesDetailedViewController alloc] initWithCourse:(Courses_Model *) [dataArray objectAtIndex:indexPath.row]];
    Courses_Model *temp = (Courses_Model *)[dataArray objectAtIndex:indexPath.row];
    detailedView.title = temp.course_name;
    [self.navigationController pushViewController:detailedView animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
