//
//  HealthCalculator.m
//  HealthIndicator
//
//  Created by gaohy on 11/08/13.
//  Copyright (c) 2013 harry gao. All rights reserved.
//

#import "HealthCalculator.h"
#import "PDataAccessor.h"
#import "PPerson.h"

@implementation HealthCalculator

+(int)calcScoreBasedOnBMI:(int)bmi
{
    if(bmi < 6 || bmi > 36){
        return 0;
    }
    
    if(bmi <=26){
        return (bmi-6)*5;
    }
    return 100 - (bmi-26)*5;
}

+ (int)calcScoreBasedOnOriginalScore:(int)score Calori:(int)calori Fat:(int)fat
{
    int newVal = score;
    if(calori > 3000 || fat >300){
        newVal = score - 3;
        if(newVal <0){
            newVal = 0;
        }
    }
    
    else if(calori > 1000 || fat > 100){
        newVal = score - 1;
        if(newVal <0){
            newVal = 0;
        }
    }
    return newVal;
}

@end
