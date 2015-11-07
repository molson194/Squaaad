//
//  PostScreenViewController.m
//  Squaaad
//
//  Created by Matthew Levey on 11/7/15.
//  Copyright © 2015 Molson. All rights reserved.
//

#import "PostScreenViewController.h"

@interface PostScreenViewController ()

@end

@implementation PostScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
            action:@selector(postTo)];
}

- (void)postTo {

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
