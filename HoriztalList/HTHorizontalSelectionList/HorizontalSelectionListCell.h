//
//  HorizontalSelectionListCell.h
//  12123
//
//  Created by 刘伟 on 2016/9/21.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalSelectionListCell : UICollectionViewCell

@property(nonatomic,copy)NSString*title;
@property(nonatomic,strong,readonly)UIButton*titleButton;
@end
