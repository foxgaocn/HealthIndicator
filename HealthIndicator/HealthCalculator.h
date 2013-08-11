//
//  HealthCalculator.h
//  HealthIndicator
//
//  Created by gaohy on 11/08/13.
//  Copyright (c) 2013 harry gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDataAccessor.h"

@interface HealthCalculator : NSObject
+(int) calcScoreBasedOnBMI:(int)bmi;
+(int) calcScoreBasedOnOriginalScore:(int)score Calori:(int)calori Fat:(int)fat;
@end
