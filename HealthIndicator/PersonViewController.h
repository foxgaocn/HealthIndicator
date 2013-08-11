//
//  PersonViewController.h
//  HealthIndicator
//
//  Created by gaohy on 10/08/13.
//  Copyright (c) 2013 harry gao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDataAccessor.h"


@interface PersonViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) id<PDataAccessor> dataAccessor;

@property (weak, nonatomic) IBOutlet UITextField *nameInput;
@property (weak, nonatomic) IBOutlet UITextField *weightInput;
@property (weak, nonatomic) IBOutlet UITextField *heightInput;

-(IBAction) save:(id)sender;
-(IBAction) cancel:(id)sender;
@end
