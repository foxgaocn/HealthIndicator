//
//  PPerson.h
//  HealthIndicator
//
//  Created by gaohy on 11/08/13.
//  Copyright (c) 2013 harry gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PPerson <NSObject>

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * height;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) NSNumber * health;

@end
