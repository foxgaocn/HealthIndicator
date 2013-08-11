//
//  MasterViewController.h
//  HealthIndicator
//
//  Created by gaohy on 11/08/13.
//  Copyright (c) 2013 harry gao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDataAccessor.h"

@interface MasterViewController : UIViewController

@property (nonatomic, strong) id<PDataAccessor> dataAccessor;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIView *noDataView;
@property (weak, nonatomic) IBOutlet UIView *dataView;


-(IBAction)personalViewClicked:(id)sender;
-(IBAction)dietViewClicked:(id)sender;
@end
