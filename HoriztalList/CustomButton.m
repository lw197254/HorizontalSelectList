//
//  CustomButton.m
//  HoriztalList
//
//  Created by 刘伟 on 2017/8/4.
//  Copyright © 2017年 万圣伟业. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    UIView*view = self.superview;
    if (view) {
        for (UIControl*control in view.subviews) {
            if (![control isKindOfClass:[UIControl class]]||control==self) {
                continue;
            }
            
            
            control.highlighted = highlighted;
        }
    }
    
}
@end
