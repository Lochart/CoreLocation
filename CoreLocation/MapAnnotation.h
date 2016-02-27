//
//  MapAnnotation.h
//  CoreLocation
//
//  Created by Nikolay on 26.02.16.
//  Copyright © 2016 Nikolay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

-(id)initWithTitle: (NSString *)title subtitle: (NSString *) subtitle coordinate: (CLLocationCoordinate2D) coordinate;


@end
