//
//  MapScreenViewController.m
//  Squaaad
//
//  Created by Matthew Levey on 11/7/15.
//  Copyright © 2015 Molson. All rights reserved.
//

#import "MapScreenViewController.h"
#import "PostScreenViewController.h"

@interface MapScreenViewController ()

@end

@implementation MapScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self
                                             action:@selector(goToPost)];
    
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:mapView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) goToPost {
    UINavigationController *postScreenNavigation = [[UINavigationController alloc] initWithRootViewController:[[PostScreenViewController alloc] init]];
    [self presentViewController:(postScreenNavigation) animated:NO completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
