//
//  DataAccessor.h
//  HealthIndicator
//
//  Created by gaohy on 11/08/13.
//  Copyright (c) 2013 harry gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDataAccessor.h"
#import "PPerson.h"

@interface DataAccessor : NSObject <PDataAccessor>
-(DataAccessor*) initWithManagedDataContext:(NSManagedObjectContext*) moc;
@end
