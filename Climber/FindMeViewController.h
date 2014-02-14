//
//  FindMeViewController.h
//  Climber
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FindMeViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
    CLLocation *_startLocation;
    NSString *_latitude, *_longitude, *_altitude;;
    
}

@end
