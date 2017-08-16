//
//  HorizontalSelectionListCell.m
//  12123
//
//  Created by 刘伟 on 2016/9/21.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "HorizontalSelectionListCell.h"


@implementation HorizontalSelectionListCell

@synthesize titleButton = _titleButton;

-(void)awakeFromNib{
    [super awakeFromNib];
//    [[HorizontalSelectionListCell alloc]initWithFrame:CGRectZero];
//    UIButton

}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
//        [self mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(40);
//        }];
      
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    _titleButton.highlighted = highlighted;
}
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    _titleButton.selected = selected;
}
-(void)setTitle:(NSString*)title{
    [self.titleButton setTitle:title forState:UIControlStateNormal];
}
-(UIButton*)titleButton{
    if (!_titleButton) {
        _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        _titleButton.tintColor = [UIColor clearColor];
        _titleButton.userInteractionEnabled = NO;
        [_titleButton setTitleColor:[UIColor brownColor] forState:UIControlStateHighlighted];
        [self.contentView addSubview:_titleButton];
        [_titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
           
        }];
    }
    
    return _titleButton;
}
-(UICollectionViewLayoutAttributes*)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
//    [self setNeedsLayout];
//    [self layoutIfNeeded];
//    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size]; // 获取自适应size
//    CGRect newFrame = layoutAttributes.frame;
//    newFrame.size.height = size.height;
//    newFrame.size.width = size.width;
//    layoutAttributes.frame = newFrame;
    
    
    
    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    CGRect rect = [self.titleButton.titleLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 30) options:NSStringDrawingTruncatesLastVisibleLine|   NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18]} context:nil];
    rect.size.width +=8;
    rect.size.height+=8;
    attributes.frame = rect;
    return attributes;
    return layoutAttributes;
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
