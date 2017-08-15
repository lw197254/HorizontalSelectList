//
//  TableViewCell.m
//  HoriztalList
//
//  Created by 刘伟 on 2017/8/4.
//  Copyright © 2017年 万圣伟业. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.Label = [[UILabel alloc]init];
        self.Label.numberOfLines = 0;
        [self addSubview:self.Label];
        [self.Label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
