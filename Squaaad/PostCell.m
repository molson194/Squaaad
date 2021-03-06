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
        
        
        self.time= [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 200, 50)];
        self.time.textColor = [UIColor blackColor];
        self.time.font = [self.time.font fontWithSize:10];
        [self addSubview:self.time];
        
        self.rsvp = [[UIButton alloc] initWithFrame:CGRectMake(250, 20, 50, 25)];
        self.rsvp.backgroundColor = [UIColor grayColor];
        
        [self.rsvp setTitle:@"RSVP" forState:UIControlStateNormal];
        [self addSubview:self.rsvp];
        
        
       
    }
    
    return self;
}

@end
