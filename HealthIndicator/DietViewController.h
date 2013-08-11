//
//  DietViewController.h
//  HealthIndicator
//
//  Created by gaohy on 11/08/13.
//  Copyright (c) 2013 harry gao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDataAccessor.h"

@interface DietViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) id<PDataAccessor> dataAccessor;

@property (weak, nonatomic) IBOutlet UITextField *caroliInput;
@property (weak, nonatomic) IBOutlet UITextField *fatInput;


-(IBAction) save:(id)sender;
-(IBAction) cancel:(id)sender;
@end
