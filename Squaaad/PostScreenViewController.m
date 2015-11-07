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
#import <QuartzCore/QuartzCore.h>

@interface PostScreenViewController ()

@end

@implementation PostScreenViewController

NSString * title;
UITextField *TitleTextField;
NSString * description;
UITextView *descTextView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                              action:@selector(postTo)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self
                                             action:@selector(goToMain)];
    
    CGRect titleTextFieldFrame = CGRectMake(20.0f, 70.0f, 280.0f, 50.0f);
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
    
    CGRect textViewFrame = CGRectMake(20.0f, 130.0f, 280.0f, 80.0f);
    descTextView = [[UITextView alloc] initWithFrame:textViewFrame];
    descTextView.returnKeyType = UIReturnKeyDone;
    descTextView.layer.borderWidth = 1.0f;
    descTextView.layer.cornerRadius = 4.0f;
    descTextView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    descTextView.text = @"Description";
    descTextView.textColor = [UIColor lightGrayColor];
    descTextView.delegate = self;
    [self.view addSubview:descTextView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
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

static inline BOOL IsDis(NSString* thing) {
    if ([thing isEqualToString:@"Description"])
        return 1;
    return 0;
}

- (void)postTo{
    title = TitleTextField.text;
    description = descTextView.text;
    if (IsEmpty(title) || IsDis(description)) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Please fill in required fields" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    } else {
        PFObject *eventObject = [PFObject objectWithClassName:@"eventObject"];
        eventObject[@"Title"] = title;
        eventObject[@"Descriton"] = description;
        [eventObject saveInBackground];
        [self goToMain];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    descTextView.text = @"";
    descTextView.textColor = [UIColor blackColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(descTextView.text.length == 0){
        descTextView.textColor = [UIColor lightGrayColor];
        descTextView.text = @"Description";
        [descTextView resignFirstResponder];
    }
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