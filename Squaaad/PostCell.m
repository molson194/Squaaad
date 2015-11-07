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
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
        self.title.textColor = [UIColor blackColor];
        [self addSubview:self.title];
    }
    
    return self;
}

@end
