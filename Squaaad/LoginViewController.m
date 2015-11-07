//
//  LoginViewController.m
//  Squaaad
//
//  Created by Matthew Olson on 11/7/15.
//  Copyright © 2015 Molson. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton addTarget:self action:@selector(loginUser) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setTitle:@"Login Button" forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor redColor];
    loginButton.frame = CGRectMake(80, 210, 160, 40);
    [self.view addSubview:loginButton];
}

- (void) loginUser {
    NSArray *permissionsArray = @[ @"user_about_me"];
    [PFFacebookUtils logInInBackgroundWithReadPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if (user) {
            [(AppDelegate*)[[UIApplication sharedApplication] delegate] setupMainView];
        }}];
}

@end
