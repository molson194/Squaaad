//
//  ViewController.m
//  Squaaad
//
//  Created by Matthew Olson on 11/5/15.
//  Copyright © 2015 Molson. All rights reserved.
//

#import <Parse/Parse.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import "MainFeedViewController.h"
#import "PostCell.h"

@interface MainFeedViewController ()

@end

@implementation MainFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

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
    cell.description.text = [object objectForKey:@"Description"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end
