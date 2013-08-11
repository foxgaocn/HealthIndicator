//
//  PersonViewController.m
//  HealthIndicator
//
//  Created by gaohy on 10/08/13.
//  Copyright (c) 2013 harry gao. All rights reserved.
//

#import "PersonViewController.h"
#import "Person.h"



@implementation PersonViewController{
    Person* person;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    person = [self.dataAccessor getPerson];
    if(person){
        self.nameInput.text = person.name;
        self.nameInput.enabled = NO;
        self.nameInput.backgroundColor = [UIColor lightGrayColor];
        self.weightInput.text = [person.weight stringValue];
        self.heightInput.text = [person.height stringValue];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)save:(id)sender{
    NSString* name = self.nameInput.text;
    NSNumber* weight = [NSNumber numberWithInt: [self.weightInput.text intValue]];
    NSNumber* height = [NSNumber numberWithInt: [self.heightInput.text intValue]];
    [self.dataAccessor updatePersonName:name Weight:weight Height:height];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)cancel:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == self.nameInput || textField == self.weightInput || textField == self.heightInput){
        [textField resignFirstResponder];
    }
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField != self.heightInput && textField != self.weightInput)
    {
        return YES;
    }
    
    if(string.length == 0)
    {
        return YES;
    }
    
    NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    for (int i = 0; i < [string length]; i++) {
        unichar c = [string characterAtIndex:i];
        if ([myCharSet characterIsMember:c]) {
            return YES;
        }
    }
    
    return NO;
}

@end
