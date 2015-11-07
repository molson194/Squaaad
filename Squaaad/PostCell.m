//
//  PostCell.m
//  Squaaad
//
//  Created by Matthew Olson on 11/7/15.
//  Copyright © 2015 Molson. All rights reserved.
//

#import "PostCell.h"

@implementation PostCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 15)];
        self.title.textColor = [UIColor blackColor];
        [self addSubview:self.title];
        
        self.desc = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 100, 30)];
        self.desc.textColor = [UIColor blackColor];
        self.desc.font = [self.desc.font fontWithSize:10];
        [self addSubview:self.desc];
    }
    
    return self;
}

@end
