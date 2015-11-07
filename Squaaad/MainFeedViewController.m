//
//  ViewController.m
//  Squaaad
//
//  Created by Matthew Olson on 11/5/15.
//  Copyright © 2015 Molson. All rights reserved.
//

#import <Parse/Parse.h>
#import "MainFeedViewController.h"

@interface MainFeedViewController ()

@end

@implementation MainFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(aMethod) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(80, 210, 160, 40);
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 addTarget:self action:@selector(aMethod2) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"Button2" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor blueColor];
    button2.frame = CGRectMake(80, 260, 160, 40);
    [self.view addSubview:button2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)aMethod {
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"Mike";
    [testObject saveInBackground];
}
- (void)aMethod2 {
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"Matt";
    [testObject saveInBackground];
}

@end
