//
//  DetailViewController.h
//  HealthIndicator
//
//  Created by gaohy on 10/08/13.
//  Copyright (c) 2013 harry gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
