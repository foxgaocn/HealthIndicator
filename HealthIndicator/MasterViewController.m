//
//  MasterViewController.m
//  HealthIndicator
//
//  Created by gaohy on 11/08/13.
//  Copyright (c) 2013 harry gao. All rights reserved.
//

#import "MasterViewController.h"
#import "PersonViewController.h"
#import "DietViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

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
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    id<PPerson> person = [self.dataAccessor getPerson];
    if(!person){
        self.dataView.hidden = true;
        self.noDataView.hidden = false;
    }
    else
    {
        self.dataView.hidden = false;
        self.noDataView.hidden = true;
        NSNumber *score = [self.dataAccessor getPerson].health;
        self.scoreLabel.text = [score stringValue];
        NSString *imageName = [self getImageNameBasedOnScore:[score intValue]];
        self.image.image = [UIImage imageNamed:imageName];
    }    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - button actions
-(IBAction)personalViewClicked:(id)sender
{
    PersonViewController *personalViewController = [[PersonViewController alloc] initWithNibName:@"PersonViewController" bundle:nil];
    personalViewController.dataAccessor = self.dataAccessor;
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:personalViewController];
    navController.modalPresentationStyle = UIModalPresentationFormSheet;
    navController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self.navigationController presentViewController:navController animated:YES completion:nil];
}

-(IBAction)dietViewClicked:(id)sender
{
    DietViewController *dietViewController = [[DietViewController alloc] initWithNibName:@"DietViewController" bundle:nil];
    dietViewController.dataAccessor = self.dataAccessor;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:dietViewController];
    navController.modalPresentationStyle = UIModalPresentationFormSheet;
    navController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self.navigationController presentViewController:navController animated:YES completion:nil];
}

-(NSString*)getImageNameBasedOnScore:(int)score{
    if(score < 50){
        return @"red.jpeg";
    }
    if(50<=score && score <70){
        return @"warning.jpeg";
    }
    return @"thumbs.jpeg";
}


@end
