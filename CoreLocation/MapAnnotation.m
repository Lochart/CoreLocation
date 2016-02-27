//
//  MapAnnotation.m
//  CoreLocation
//
//  Created by Nikolay on 26.02.16.
//  Copyright © 2016 Nikolay. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation

-(id)initWithTitle: (NSString *)title subtitle: (NSString *) subtitle coordinate: (CLLocationCoordinate2D) coordinate{

    self = [super init];
    if (self) {
        self.title = title;
        self.subtitle = subtitle;
        self.coordinate = coordinate;
    }
    return  self;
}

@end
