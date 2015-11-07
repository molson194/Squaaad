//
//  ViewController.m
//  Squaaad
//
//  Created by Matthew Olson on 11/5/15.
//  Copyright © 2015 Molson. All rights reserved.
//

#import <Parse/Parse.h>
#import "MainFeedViewController.h"
<<<<<<< HEAD
#import "PostCell.h"
=======
#import "PostScreenViewController.h"
>>>>>>> master

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
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self
                                              action:@selector(open_PostScreen)];
    
}
- (void)open_PostScreen{
    UINavigationController *postScreenNavigation = [[UINavigationController alloc] initWithRootViewController:[[PostScreenViewController alloc] init]];
    [self presentViewController:(postScreenNavigation) animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

<<<<<<< HEAD
- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if(self){
        self.parseClassName = @"eventObject";
        self.pullToRefreshEnabled = YES;
        self.paginationEnabled = YES;
        self.objectsPerPage = 10;
    }
    return self;
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForNextPageAtIndexPath:(nonnull NSIndexPath *)indexPath object:(PFObject * ) object {
    
    static NSString *CellIdentifier = @"Cell";
    
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil) {
        cell = [[PostCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.title.text = [object objectForKey:@"Title"];
    cell.description.text = @"2";//[object objectForKey:@"Descriton"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end
=======
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
>>>>>>> master
