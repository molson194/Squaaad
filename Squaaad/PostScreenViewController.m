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

@property (nonatomic, strong) PFGeoPoint *geoPoint;

@end

@implementation PostScreenViewController

NSString * title;
UITextField *TitleTextField;
NSString * description;
UITextField *locationInput;
UITextView *descTextView;
NSString *errorChecking= @"Empty";
NSString *errorChecking2= @"Empty";
NSDate *d;
NSDate *d2;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                              action:@selector(postTo)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self
                                             action:@selector(goToMain)];
    
    CGRect titleTextFieldFrame = CGRectMake(20.0f, 70.0f, 280.0f, 40.0f);
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
    
    CGRect textViewFrame = CGRectMake(20.0f, 120.0f, 280.0f, 70.0f);
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
    
    CGRect locationFrame = CGRectMake(20.0f, 200.0f, 280.0f, 40.0f);
    locationInput = [[UITextField alloc] initWithFrame:locationFrame];
    locationInput.placeholder = @"Enter a location...";
    locationInput.backgroundColor = [UIColor whiteColor];
    locationInput.textColor = [UIColor blackColor];
    locationInput.font = [UIFont systemFontOfSize:16.0f];
    locationInput.borderStyle = UITextBorderStyleRoundedRect;
    locationInput.clearButtonMode = UITextFieldViewModeWhileEditing;
    locationInput.returnKeyType = UIReturnKeyDone;
    locationInput.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    locationInput.tag = 2;
    locationInput.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:locationInput];
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenWidth = screenSize.width;
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 addTarget:self action:@selector(callDP) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"Start" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor blueColor];
    button2.frame = CGRectMake(0, 250, screenWidth/4, 35);
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 addTarget:self action:@selector(callDP2) forControlEvents:UIControlEventTouchUpInside];
    [button3 setTitle:@"End" forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor redColor];
    button3.frame = CGRectMake(0, 285, screenWidth/4, 35);
    [self.view addSubview:button3];
    
    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
        if (!error) {
            self.geoPoint = geoPoint;
        }
    }];
    
    
}

- (void)changeDate:(UIDatePicker *)sender {
    NSLog(@"New Date: %@", sender.date);
    UILabel *label1 = [[UILabel alloc] init];
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenWidth = screenSize.width;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    d= sender.date;
    df.dateStyle = NSDateFormatterMediumStyle;
    label1.text = [NSString stringWithFormat:@"%@",[df stringFromDate:sender.date]];
    errorChecking= label1.text;
    label1.frame = CGRectMake(screenWidth/4, 230, 240, 35);
    label1.backgroundColor = [UIColor blueColor];
    label1.textColor = [UIColor whiteColor];
    label1.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:label1];
    
    // code to get the date and time  in a string.
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSDate *date = [NSDate date];
   label1.text = [dateFormatter stringFromDate:sender.date];
    
}

- (void)changeDate2:(UIDatePicker *)sender {
    NSLog(@"New Date: %@", sender.date);
    UILabel *label2 = [[UILabel alloc] init];
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenWidth = screenSize.width;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    d2= sender.date;
    df.dateStyle = NSDateFormatterMediumStyle;
    label2.text = [NSString stringWithFormat:@"%@",[df stringFromDate:sender.date]];
    errorChecking2= label2.text;
    label2.frame = CGRectMake(screenWidth/4, 265, 240, 35);
    label2.backgroundColor = [UIColor redColor];
    label2.textColor = [UIColor whiteColor];
    label2.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:label2];
    
    // code to get the date and time  in a string.
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    label2.text = [dateFormatter stringFromDate:sender.date];
    
}

- (void)removeViews:(id)object {
    [[self.view viewWithTag:9] removeFromSuperview];
    [[self.view viewWithTag:10] removeFromSuperview];
    [[self.view viewWithTag:11] removeFromSuperview];
}

- (void)dismissDatePicker:(id)sender {
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height, 320, 44);
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height+44, 320, 216);
    [UIView beginAnimations:@"MoveOut" context:nil];
    [self.view viewWithTag:9].alpha = 0;
    [self.view viewWithTag:10].frame = datePickerTargetFrame;
    [self.view viewWithTag:11].frame = toolbarTargetFrame;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeViews:)];
    [UIView commitAnimations];
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

static inline BOOL isErr(NSString* thing) {
    if ([thing isEqualToString:@"Empty"])
        return 1;
    return 0;
}

- (void)postTo{
    title = TitleTextField.text;
    description = descTextView.text;
    if (IsEmpty(title) || IsDis(description) || IsEmpty(description) || isErr(errorChecking) || isErr(errorChecking2)) {
        NSString *holder=description;
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Please fill in required fields" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        descTextView.text = holder;
        
    } else {
        PFObject *eventObject = [PFObject objectWithClassName:@"eventObject"];
        eventObject[@"Title"] = title;
        eventObject[@"Descriton"] = description;
        eventObject[@"TextLocation"] = locationInput.text;
        eventObject[@"Start"] = d;
        eventObject[@"End"] = d2;
        eventObject[@"User"] = [PFUser currentUser];
        if (self.geoPoint) {
            eventObject[@"Location"] = self.geoPoint;
        } else {
            eventObject[@"Location"] = [PFGeoPoint geoPointWithLatitude:0 longitude:0];
        }
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

- (void)callDP{
    if ([self.view viewWithTag:9]) {
        return;
    }
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height-216-44, 320, 44);
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height-216, 320, 216);
    
    UIView *darkView = [[UIView alloc] initWithFrame:self.view.bounds];
    darkView.alpha = 0;
    darkView.backgroundColor = [UIColor whiteColor];
    darkView.tag = 9;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDatePicker:)] ;
    [darkView addGestureRecognizer:tapGesture];
    [self.view addSubview:darkView];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height+44, 320, 216)];
    datePicker.tag = 10;
    [datePicker addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, 320, 44)];
    toolBar.tag = 11;
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissDatePicker:)];
    [toolBar setItems:[NSArray arrayWithObjects:spacer, doneButton, nil]];
    [self.view addSubview:toolBar];
    
    [UIView beginAnimations:@"MoveIn" context:nil];
    toolBar.frame = toolbarTargetFrame;
    datePicker.frame = datePickerTargetFrame;
    darkView.alpha = 0.5;
    [UIView commitAnimations];
    
    
    
    
}

- (void)callDP2{
    if ([self.view viewWithTag:9]) {
        return;
    }
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height-216-44, 320, 44);
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height-216, 320, 216);
    
    UIView *darkView = [[UIView alloc] initWithFrame:self.view.bounds];
    darkView.alpha = 0;
    darkView.backgroundColor = [UIColor whiteColor];
    darkView.tag = 9;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDatePicker:)] ;
    [darkView addGestureRecognizer:tapGesture];
    [self.view addSubview:darkView];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height+44, 320, 216)];
    datePicker.tag = 10;
    [datePicker addTarget:self action:@selector(changeDate2:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, 320, 44)];
    toolBar.tag = 11;
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissDatePicker:)];
    [toolBar setItems:[NSArray arrayWithObjects:spacer, doneButton, nil]];
    [self.view addSubview:toolBar];
    
    [UIView beginAnimations:@"MoveIn" context:nil];
    toolBar.frame = toolbarTargetFrame;
    datePicker.frame = datePickerTargetFrame;
    darkView.alpha = 0.5;
    [UIView commitAnimations];
    
    
    
    
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