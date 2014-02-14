//
//  AllClassesDetailedViewController.m
//  Climber
//
//  Created by Student on 2/1/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "AllClassesDetailedViewController.h"
#import "DetailedClassCell.h"

@interface AllClassesDetailedViewController ()

@end

@implementation AllClassesDetailedViewController

@synthesize dataTable;

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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) shouldAutorotate{
    return NO;
}

- (instancetype) initWithCourse:(Courses_Model *)course
{
    if ([super init]) {
        self.view.backgroundColor = [UIColor whiteColor];
        
        NSURL *url = [NSURL URLWithString:course.image];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        image = [[UIImageView alloc] initWithImage:img];
        image.frame = CGRectMake(5.0, 90.0, 65.0, 65.0);
        [self.view addSubview:image];
        
        publisher = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 150.0, 60.0, 20.0)];
        UIFont *font = [UIFont fontWithName:@"AvenirLTPro-Medium" size:12];
        publisher.text = course.publisher;
        publisher.textAlignment = NSTextAlignmentCenter;
        publisher.font = font;
        [self.view addSubview:publisher];
        
        course_name = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 85.0, 230.0, 20.0)];
        font = [UIFont fontWithName:@"AvenirLTPro-Heavy" size:16];
        course_name.text = course.course_name;
        course_name.font = font;
        [self.view addSubview:course_name];
        
        total_lessons = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 107.0, 70.0, 14.0)];
        font = [UIFont fontWithName:@"AvenirLTPro-Medium" size:12];
        total_lessons.text = course.total_lessons;
        total_lessons.font = font;
        [self.view addSubview:total_lessons];
        
        total_time = [[UILabel alloc] initWithFrame:CGRectMake(150.0, 107.0, 100.0, 14.0)];
        font = [UIFont fontWithName:@"AvenirLTPro-Medium" size:12];
        total_time.text = course.total_time;
        total_time.font = font;
        [self.view addSubview:total_time];
        
        description = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 122.0, 210.0, 90.0)];
        font = [UIFont fontWithName:@"AvenirLTPro-Light" size:14];
        description.font = font;
        description.text = course.description;
        description.numberOfLines = -1;
        [self.view addSubview:description];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10.0, 212.0, 300.0, 1.0)];
        line.backgroundColor = [UIColor blackColor];
        [self.view addSubview:line];
        
        dataArray = [[NSMutableArray alloc] init];
        dataArray = course.lesson;
        [self loadTable];
    }
    return self;
}

-(void) loadTable
{
    dataTable = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 218.0, self.view.frame.size.width, self.view.frame.size.height - 218) style:UITableViewStylePlain];
    [dataTable setSeparatorColor:[UIColor clearColor]];
    [self.dataTable setContentSize:CGSizeMake(self.view.bounds.size.width, 1000.0)];
    dataTable.delegate = self;
    dataTable.dataSource = self;
    [self.view addSubview:dataTable];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailedClassCell *cell;
    static NSString *CellIdentifier = @"Cell";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[DetailedClassCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSArray *temp = [dataArray objectAtIndex:indexPath.row];
    //cell.serial.text = [temp objectAtIndex:0];
    NSString *str = [NSString stringWithFormat:@"%@ %@", [temp objectAtIndex:0], [temp objectAtIndex:1]];
    cell.course_name.text = str;
    cell.time.text = [temp objectAtIndex:3];
    NSURL *url = [NSURL URLWithString:[temp objectAtIndex:4]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    cell.image.image = img;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *temp = [dataArray objectAtIndex:indexPath.row];
    NSString *urlStore = [temp objectAtIndex:2];
    NSURL *url = [NSURL URLWithString:urlStore];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [[self navigationItem] setTitle: [[dataArray objectAtIndex:indexPath.row] objectAtIndex:1]];
    
    UIViewController *webController = [[UIViewController alloc] init];
    [webController.view addSubview:webView];
    webController.title = [[dataArray objectAtIndex:indexPath.row] objectAtIndex:1];
    [self.navigationController pushViewController:webController animated:YES];
    
//    MPMoviePlayerController *moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
//    moviePlayer.controlStyle = MPMovieControlStyleDefault;
//    moviePlayer.shouldAutoplay = YES;
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
//    [self.view addSubview:moviePlayer.view];
//    [moviePlayer setFullscreen:YES animated:YES];
//    [moviePlayer prepareToPlay];
}

//- (void) moviePlayBackDidFinish: (NSNotification *) notification
//{
//    MPMoviePlayerController *moviePlayer = [notification object];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
//    if ([moviePlayer respondsToSelector:@selector(setFullscreen:animated:)]) {
//        [moviePlayer.view removeFromSuperview];
//    }
//}

@end
