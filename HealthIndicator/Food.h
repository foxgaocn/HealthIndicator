//
//  Food.h
//  HealthIndicator
//
//  Created by gaohy on 11/08/13.
//  Copyright (c) 2013 harry gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Food : NSManagedObject

@property (nonatomic, retain) NSNumber * calori;
@property (nonatomic, retain) NSNumber * fat;
@property (nonatomic, retain) NSDate * date;

@end
