//
//  HealthIndicator - HealthCalculatorTest.m
//  Copyright 2013 harry gao. All rights reserved.
//
//  Created by: gaohy
//

    // Class under test
#import "HealthCalculator.h"
    // Collaborators

    // Test support
#import <SenTestingKit/SenTestingKit.h>

// Uncomment the next two lines to use OCHamcrest for test assertions:
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

// Uncomment the next two lines to use OCMockito for mock objects:
#define MOCKITO_SHORTHAND
#import <OCMockitoIOS/OCMockitoIOS.h>

#import "PDataAccessor.h"
#import "Person.h"
#import "DummyPerson.h"

@interface HealthCalculatorTest : SenTestCase
@end

@implementation HealthCalculatorTest
{
    HealthCalculator* sut;
    id<PDataAccessor> mockDA;
}

- (void)setUp{
}

- (void)testCalculatorShouldReturn60WithBelowStardandBMI
{
    int score = [HealthCalculator calcScoreBasedOnBMI:18];
    assertThatInt(score, is(@60));
}

- (void)testCalculatorShouldReturn70WithAboveStardandBMI
{
    
    int score = [HealthCalculator calcScoreBasedOnBMI:20];
    assertThatInt(score, is(@70));
}

- (void)testCalculatorShouldReturn100WithStardandBMI
{
    int score = [HealthCalculator calcScoreBasedOnBMI:26];
    assertThatInt(score, is(@100));
}

- (void)testCalculatorShouldReturn0WithAbornalBMI
{
    int score = [HealthCalculator calcScoreBasedOnBMI:0];
    assertThatInt(score, is(@0));
}

- (void)testCalculatorShouldReturn0WithAbsitiveBMI
{
    int score = [HealthCalculator calcScoreBasedOnBMI:100];
    assertThatInt(score, is(@0));
}

- (void)testCalculateWith5000CaloriWillReduce3
{
    int score = [HealthCalculator calcScoreBasedOnOriginalScore:50 Calori:5000 Fat:500];
    assertThatInt(score, is(@47));
}

- (void)testCalculateWith1500CaloriWillReduce1
{
    int score = [HealthCalculator calcScoreBasedOnOriginalScore:50 Calori:1500 Fat:0];
    assertThatInt(score, is(@49));
}

- (void)testCalculateWith500CaloriWillNotReduce
{
    int score = [HealthCalculator calcScoreBasedOnOriginalScore:50 Calori:500 Fat:0];
    assertThatInt(score, is(@50));
}

- (void)testCalculateWith500FatWillReduce3
{
    int score = [HealthCalculator calcScoreBasedOnOriginalScore:50 Calori:0 Fat:500];
    assertThatInt(score, is(@47));
}

- (void)testCalculateWith150FatWillReduce1
{
    int score = [HealthCalculator calcScoreBasedOnOriginalScore:50 Calori:0 Fat:150];
    assertThatInt(score, is(@49));
}

- (void)testCalculateWith0FatWillNotReduce
{
    int score = [HealthCalculator calcScoreBasedOnOriginalScore:50 Calori:0 Fat:0];
    assertThatInt(score, is(@50));
}
@end
