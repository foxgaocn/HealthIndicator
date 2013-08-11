//
//  DataAccessor.m
//  HealthIndicator
//
//  Created by gaohy on 11/08/13.
//  Copyright (c) 2013 harry gao. All rights reserved.
//

#import "DataAccessor.h"
#import "PPerson.h"
#import "PFood.h"
#import "HealthCalculator.h"

@implementation DataAccessor{
    NSManagedObjectContext* _moc;
    
    //cache the person because we only have one
    id<PPerson> _person;
}

-(DataAccessor *)initWithManagedDataContext:(NSManagedObjectContext *)moc
{
    if(self = [super init]){
        _moc = moc;
        return self;
    }
    return nil;
}

-(id<PPerson>)getPerson
{
    if(!_person){
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:_moc];
        [request setEntity:entity];
        
        NSError *error = nil;
        NSMutableArray *mutableFetchResults = [[_moc executeFetchRequest:request error:&error] mutableCopy];
        if (mutableFetchResults == nil || mutableFetchResults.count == 0) {
            _person = nil;
        }
        else{
            _person = [mutableFetchResults objectAtIndex:0];
        }
    }
    return _person;
}

-(void)updatePersonName:(NSString *)name Weight:(NSNumber*)weight Height:(NSNumber*)height{
    if(!_person){
        _person = (id<PPerson>)[NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:_moc];
    }
    _person.name = name;
    _person.weight = weight;
    _person.height = height;
    
    int w = [weight intValue];
    int h = [height intValue];
    int bmi = w*10000/h/h;
    _person.health = [NSNumber numberWithInt:[HealthCalculator calcScoreBasedOnBMI:bmi]];
    
    NSError *error = nil;
    if (![_moc save:&error]) {
        NSLog(@"error saving person");
    }

}

-(int)saveFood:(NSNumber *)fat Calori:(NSNumber *)calori{
    id<PFood> food = (id<PFood>)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:_moc];
    food.fat= fat;
    food.calori = calori;
    food.date = [NSDate date];
    
    NSError *error = nil;
    if (![_moc save:&error]) {
        NSLog(@"error saving diet");
        return -1;
    }
    return 0;
}

-(void)updatePersonHealthByFat:(int)fat Caloir:(int)calori
{
    if(!_person) return;
    
    int newScore = [HealthCalculator calcScoreBasedOnOriginalScore:[_person.health intValue] Calori:calori Fat:fat];
    
    _person.health = [NSNumber numberWithInt:newScore];
    
    NSError *error = nil;
    if (![_moc save:&error]) {
        NSLog(@"error update health");
    }
}
@end
