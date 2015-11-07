//
//  PostCell.m
//  Squaaad
//
//  Created by Matthew Olson on 11/7/15.
//  Copyright © 2015 Molson. All rights reserved.
//

#import "PostCell.h"

@implementation PostCell

@synthesize description;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 50)];
        self.title.textColor = [UIColor blackColor];
        [self addSubview:self.title];
        
        self.description = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 200, 50)];
        self.description.textColor = [UIColor blackColor];
        [self addSubview:self.description];

    }
    
    return self;
}

@end


