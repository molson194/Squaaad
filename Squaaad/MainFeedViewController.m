//
//  ViewController.m
//  Squaaad
//
//  Created by Matthew Olson on 11/5/15.
//  Copyright © 2015 Molson. All rights reserved.
//

#import <Parse/Parse.h>
#import "MainFeedViewController.h"
#import "PostScreenViewController.h"
#import "PostCell.h"

@interface MainFeedViewController ()

@end

@implementation MainFeedViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    // PARSE TABLE VIEW SETUP
    if (self) {
        self.parseClassName = @"eventObject";
        self.pullToRefreshEnabled = YES;
        self.paginationEnabled = YES;
        self.objectsPerPage = 10;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self
                                              action:@selector(open_PostScreen)];
    
}
- (void)open_PostScreen{
    UINavigationController *postScreenNavigation = [[UINavigationController alloc] initWithRootViewController:[[PostScreenViewController alloc] init]];
    [self presentViewController:(postScreenNavigation) animated:NO completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *CellIdentifier = @"Cell";
    PostCell *cell = (PostCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[PostCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.title.text = [object objectForKey:@"Title"];
    cell.desc.text = [object objectForKey:@"Descriton"];
    NSDate *dateAndTime = [object objectForKey:@"Start"];
    NSDate *dateAndTime2 = [object objectForKey:@"End"];
    NSDateFormatter *formatter;
    NSString *timeString;
    NSString *timeString2;
    NSString *total;
    NSString *dateString;
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd-YYYY"];
    dateString = [formatter stringFromDate:dateAndTime];
    [formatter setDateFormat:@"HH:mm"];
    timeString = [formatter stringFromDate:dateAndTime];
    timeString2 = [formatter stringFromDate:dateAndTime2];
    timeString= [timeString stringByAppendingString:@"-"];
    timeString= [timeString stringByAppendingString:timeString2];
    total = [NSString stringWithFormat:@"Date: %@ Time: %@", dateString, timeString];
    cell.time.text = total;
    [cell.rsvp addTarget:self action:@selector(newRSVP:) forControlEvents:UIControlEventTouchUpInside];
    
    NSMutableArray *array = [object objectForKey:@"Attending"];
    
    if ([array containsObject:[PFUser currentUser]]) //contains [PfUSer Current])
    {
        cell.rsvp.backgroundColor = [UIColor greenColor];
        
    }
    return cell;
}

-(void) newRSVP:(UIButton *)sender {
    sender.backgroundColor = [UIColor greenColor];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end