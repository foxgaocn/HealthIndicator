//
//  PDataAccessor.h
//  HealthIndicator
//
//  Created by gaohy on 11/08/13.
//  Copyright (c) 2013 harry gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPerson.h"

@protocol PDataAccessor <NSObject>
- (id<PPerson>) getPerson;
-(void) updatePersonName:(NSString*)name Weight:(NSNumber*)weight Height:(NSNumber*)height;
-(int) saveFood:(NSNumber*)fat Calori:(NSNumber*)calori;
-(void) updatePersonHealthByFat:(int) fat Caloir:(int) calori;
@end
