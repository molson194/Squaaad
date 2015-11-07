//
//  PostScreenViewController.m
//  Squaaad
//
//  Created by Matthew Levey on 11/7/15.
//  Copyright © 2015 Molson. All rights reserved.
//

#import "PostScreenViewController.h"
#import "MainFeedViewController.h"
#import "PostScreenViewController.h"
#import <Parse/Parse.h>

@interface PostScreenViewController ()

@end

@implementation PostScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
            action:@selector(postTo)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self
                                              action:@selector(goToMain)];
}

- (void)postTo {
    PFObject *eventObject = [PFObject objectWithClassName:@"eventObject"];
    eventObject[@"Title"] = @"Title";
    eventObject[@"Descriton"] = @"This will be a sentence";
    [eventObject saveInBackground];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goToMain{
    UINavigationController *postScreenNavigation = [[UINavigationController alloc] initWithRootViewController:[[MainFeedViewController alloc] init]];
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
