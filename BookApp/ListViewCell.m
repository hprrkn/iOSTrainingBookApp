//
//  ListViewCell.m
//  BookApp
//
//  Created by Hiroyuki on 2016/05/12.
//  Copyright © 2016年 堀﨑 寛之. All rights reserved.
//

#import "ListViewCell.h"

@interface ListViewCell()
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;

@end

@implementation ListViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
