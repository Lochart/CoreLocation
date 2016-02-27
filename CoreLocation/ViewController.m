//
//  ViewController.m
//  CoreLocation
//
//  Created by Nikolay on 26.02.16.
//  Copyright © 2016 Nikolay. All rights reserved.
//

#import "ViewController.h"
#import "MapAnnotation.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self Location];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)Location{

    self.location = [[CLLocationManager alloc]init];
    self.location.delegate = self;
    self.location.desiredAccuracy = kCLLocationAccuracyBest;
    self.location.distanceFilter = kCLDistanceFilterNone;
    [self.location startUpdatingLocation];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(nonnull CLLocation *)newLocation fromLocation:(nonnull CLLocation *)oldLocation{

    NSString *lac = [[NSString alloc]initWithFormat:@"%f", newLocation.coordinate.latitude];
    
    self.latitude.text = lac;

    NSString *lon = [[NSString alloc]initWithFormat:@"%f", newLocation.coordinate.longitude];

    self.longitude.text = lon;
    
    NSString *acc = [[NSString alloc]initWithFormat:@"%f", newLocation.horizontalAccuracy];
    
    self.accuracy.text = acc;
    
    MKCoordinateSpan span;
    span.latitudeDelta = .01;
    span.longitudeDelta = .01;
    MKCoordinateRegion region;
    region.center = newLocation.coordinate;
    region.span = span;
    [self.mapView setRegion:region animated:TRUE];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(nonnull NSError *)error{

    NSString *msg = @"Error obtaining location";
    
    UIAlertView *alert;
    alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                       message:msg
                                      delegate:self
                             cancelButtonTitle:@"Ok"
                             otherButtonTitles:nil];
    [alert show];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return (self.interfaceOrientation != UIInterfaceOrientationMaskPortraitUpsideDown);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    [geocoder geocodeAddressString:textField.text completionHandler:^(NSArray *placemarks, NSError *error){
        if (error) {
            NSLog(@"Fehler: %@", [error localizedDescription]);
            return;
        }
    
        for (id object in placemarks) {
            CLPlacemark *placemark = object;
            
            MapAnnotation *annotation = [[MapAnnotation alloc]
                                         initWithTitle:[NSString stringWithFormat:@"%@ %@", placemark.postalCode, placemark.locality]
                                         subtitle:placemark.subLocality
                                         coordinate:placemark.location.coordinate];
       
            [self.mapView addAnnotation:annotation];
            
            MKCoordinateRegion region;
            region.center = annotation.coordinate;
            
            MKCoordinateSpan span;
            span.latitudeDelta = 0.01;
            span.longitudeDelta = 0.01;
            region.span = span;
            
            [self.mapView setRegion:region animated:YES];
        }
    
    }];
    
    
    return  YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
