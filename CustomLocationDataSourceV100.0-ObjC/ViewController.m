//
//  ViewController.m
//  CustomLocationDataSourceV100.0-ObjC
//
//  Created by maklMac on 1/17/17.
//  Copyright © 2017 esrichina.com. All rights reserved.
//

#import "ViewController.h"
#import <ArcGIS/ArcGIS.h>
#import "CustomLocationDataSource.h"


//test modify


@interface ViewController ()

@property (weak, nonatomic) IBOutlet AGSMapView *mapView;

@property(strong,nonatomic) AGSMap *map;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.map = [[AGSMap alloc] initWithBasemap:[AGSBasemap topographicBasemap]];
    
    self.mapView.map = self.map;
    
   
    //simulated location datasource can be used for historical track playback.
    //AGSSimulatedLocationDataSource *simulatedDS = [[AGSSimulatedLocationDataSource alloc] init];
    //simulatedDS.locations = [self simulatedLocations];
    
    //initialize custom location datasource
    CustomLocationDataSource *cDataSource = [[CustomLocationDataSource alloc] init];
    
    [self.map loadWithCompletion:^(NSError *error) {
        
        //bind datasource for location display
        self.mapView.locationDisplay.dataSource = cDataSource;
        
        //bind simulated datasource
        //self.mapView.locationDisplay.dataSource = simulatedDS;
        
        [self.mapView.locationDisplay startWithCompletion:^(NSError *error){
            
            [self.mapView.locationDisplay setLocationChangedHandler:^(AGSLocation *location) {
                    
                   NSLog(@"实际定位点：%@", self.mapView.locationDisplay.location);
                

            }];
                
        }];
        
    }];

}


//Method for build simulation location data.
-(NSArray*)simulatedLocations{
    
    NSMutableArray *simLocations = [NSMutableArray arrayWithCapacity:100];
    
    for (int i=0; i<100; i++) {
        
        AGSPoint *pt = [AGSPoint pointWithX:(120+i/2) y:(30+i/2) spatialReference:[AGSSpatialReference spatialReferenceWithWKID:4326]];
        
        AGSLocation *location = [AGSLocation locationWithPosition:pt horizontalAccuracy:0.000000 velocity:-1.000000 course:-1.000000 lastKnown:0];
        
        [simLocations addObject:location];
        
    }
    
    NSArray *resultLocaitons = [NSArray arrayWithArray:simLocations];
    
    return resultLocaitons;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
