//
//  AppDelegate.m
//  Squaaad
//
//  Created by Matthew Olson on 11/5/15.
//  Copyright © 2015 Molson. All rights reserved.
//

#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [Parse setApplicationId:@"ReW1u28NMNWhX09YCBbz8q90elYRrrFTmrw3fAjl"
                  clientKey:@"tlP8LJ13zlPwq5jQREWZfTiGF4ovMMLD0vaQsU57"];
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[ViewController alloc] init];
    return YES;
}

@end
