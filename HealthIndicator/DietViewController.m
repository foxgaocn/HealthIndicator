//
//  DietViewController.m
//  HealthIndicator
//
//  Created by gaohy on 11/08/13.
//  Copyright (c) 2013 harry gao. All rights reserved.
//

#import "DietViewController.h"
#import "PFood.h"

@interface DietViewController ()

@end

@implementation DietViewController

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
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)save:(id)sender{
    int fat = [self.fatInput.text intValue];
    int calori = [self.caroliInput.text intValue];
    if(fat> 0 || calori > 0){
        [self.dataAccessor saveFood:[NSNumber numberWithInt:fat] Calori:[NSNumber numberWithInt:calori]];
        [self.dataAccessor updatePersonHealthByFat:fat Caloir:calori];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)cancel:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == self.fatInput || textField == self.caroliInput){
        [textField resignFirstResponder];
    }
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField != self.fatInput && textField != self.caroliInput)
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
