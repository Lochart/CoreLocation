//
//  ViewController.h
//  CoreLocation
//
//  Created by Nikolay on 26.02.16.
//  Copyright © 2016 Nikolay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accuracy;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property(strong, nonatomic) CLLocationManager *location;

@end

