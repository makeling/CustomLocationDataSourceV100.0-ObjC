//
//  CustomLocationDataSource.m
//  CustomLocationDataSourceV100.0-ObjC
//
//  Created by maklMac on 1/19/17.
//  Copyright © 2017 esrichina.com. All rights reserved.
//

#import "CustomLocationDataSource.h"
#import <ArcGIS/ArcGIS.h>
#import <CoreLocation/CoreLocation.h>

@interface CustomLocationDataSource()

@property(strong,nonatomic) CLLocationManager* locationManager;

@end

@implementation CustomLocationDataSource

//@synthesize locationManager;

-(id)init{
    
    if(self = [super init]){
        
        self.locationManager = [super locationManager];
        
        self.locationManager.delegate = self;
        
    }
    
    return self;
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    AGSLocation* location = [AGSLocation locationWithCLLocation:locations[0]];
    
    AGSPoint *inputPoint = location.position;
    
    NSLog(@"设备传入定位点：%@",inputPoint);
    
    //实现客户化转换算法
    //change the location to the new
    CLLocation *clLocation = [[CLLocation alloc] initWithLatitude:inputPoint.y-10 longitude:inputPoint.x];
    
    AGSLocation *rectifyLocation = [AGSLocation locationWithCLLocation:clLocation];
    
    NSLog(@"定位改变：%@", rectifyLocation);

    [super didUpdateLocation:rectifyLocation];
    
}


@end
