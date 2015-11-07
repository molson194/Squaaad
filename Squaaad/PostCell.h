//
//  PostCell.h
//  Squaaad
//
//  Created by Matthew Olson on 11/7/15.
//  Copyright © 2015 Molson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ParseUI/ParseUI.h>

@interface PostCell : PFTableViewCell

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *description;

@end
