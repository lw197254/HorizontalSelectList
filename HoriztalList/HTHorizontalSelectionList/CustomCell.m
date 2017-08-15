//
//  CustomCell.m
//  HoriztalList
//
//  Created by 刘伟 on 2017/8/14.
//  Copyright © 2017年 万圣伟业. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.titleButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    self.titleButton.tintColor = [UIColor orangeColor];
    self.imageButton.tintColor = [UIColor redColor];
    for (UIView*view in self.contentView.subviews) {
        view.userInteractionEnabled = NO;
        view.tintColor = [UIColor redColor];
    }
    // Initialization code
}
-(void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    self.titleButton.highlighted = highlighted;
    self.imageButton.highlighted = highlighted;
}
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    self.titleButton.selected = selected;
    self.imageButton.highlighted = selected;
}

@end
