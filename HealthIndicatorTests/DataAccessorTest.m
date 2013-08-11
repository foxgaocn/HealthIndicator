//
//  HealthIndicator - DataAccessorTest.m
//  Copyright 2013 harry gao. All rights reserved.
//
//  Created by: gaohy
//

    // Class under test
#import "DataAccessor.h"
#import "Person.h"
#import "Food.h"
    // Collaborators

    // Test support
#import <SenTestingKit/SenTestingKit.h>

// Uncomment the next two lines to use OCHamcrest for test assertions:
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

// Uncomment the next two lines to use OCMockito for mock objects:
//#define MOCKITO_SHORTHAND
//#import <OCMockitoIOS/OCMockitoIOS.h>


@interface DataAccessorTest : SenTestCase
@end

@implementation DataAccessorTest
{
    DataAccessor* sut;
}

-(void)setUp
{
    //create a data context with memeroy storage for testing
    NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:[NSArray arrayWithObject:[NSBundle bundleWithIdentifier:@"HarryGao.HealthIndicator"]]];
    NSError *error = nil;
    NSPersistentStoreCoordinator * psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    [psc addPersistentStoreWithType:NSInMemoryStoreType
                      configuration:nil URL:nil options:nil error:&error];
    NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] init];
    moc.persistentStoreCoordinator = psc;
    
    sut = [[DataAccessor alloc]initWithManagedDataContext:moc];
}

- (void)testGetPersonShouldReturnNilIfNothing
{
    id val = [sut getPerson];
    STAssertNil(val, @"val is not nil");
}

- (void)testShouldSavePersonIfNotExist
{
    [sut updatePersonName:@"tom" Weight:@100 Height:@180];
    
    id<PPerson> val = [sut getPerson];
    assertThat(val.name, is(@"tom"));
    assertThat(val.health, is(@80));
}

- (void)testShouldUpdatePersonIfExist
{
    [sut updatePersonName:@"tom" Weight:@100 Height:@180];
    [sut updatePersonName:@"tom" Weight:@200 Height:@10];
    Person *val = [sut getPerson];
    assertThat(val.weight, is(@200));
}




- (void)testCanSaveAFood
{
    int ret = [sut saveFood:@100 Calori:@100];
    assertThatInt(ret, is(@0));    
}

@end
