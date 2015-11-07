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

NSString * title;
UITextField *TitleTextField;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                              action:@selector(postTo)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self
                                              action:@selector(goToMain)];
    
    CGRect titleTextFieldFrame = CGRectMake(20.0f, 70.0f, 275.0f, 50.0f);
    TitleTextField = [[UITextField alloc] initWithFrame:titleTextFieldFrame];
    TitleTextField.placeholder = @"Title";
    TitleTextField.backgroundColor = [UIColor whiteColor];
    TitleTextField.textColor = [UIColor blackColor];
    TitleTextField.font = [UIFont systemFontOfSize:16.0f];
    TitleTextField.borderStyle = UITextBorderStyleRoundedRect;
    TitleTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    TitleTextField.returnKeyType = UIReturnKeyDone;
    TitleTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    TitleTextField.tag = 2;
    TitleTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:TitleTextField];
    
    
    
    }

- (void)goToMain{
    UINavigationController *postScreenNavigation = [[UINavigationController alloc] initWithRootViewController:[[MainFeedViewController alloc] init]];
    [self presentViewController:(postScreenNavigation) animated:NO completion:nil];
}

static inline BOOL IsEmpty(NSString* thing) {
    if ([thing length]==0)
        return 1;
    return 0;
}

- (void)postTo{
    title = TitleTextField.text;
    NSLog(@"Info: %@", title);
    if (IsEmpty(title)) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Please fill in required fields" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    } else {
        PFObject *eventObject = [PFObject objectWithClassName:@"eventObject"];
        eventObject[@"Title"] = title;
        eventObject[@"Descriton"] = @"This will be a sentence";
        [eventObject saveInBackground];
        [self goToMain];
    }
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
