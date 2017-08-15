//
//  HozizontalSelectionList.h
//  HoriztalList
//
//  Created by 刘伟 on 2017/8/14.
//  Copyright © 2017年 万圣伟业. All rights reserved.
//

//
//  HorizontalSelectionList.h
//  Hightower
//
//  Created by Erik Ackermann on 7/31/14.
//  Copyright (c) 2014 Hightower Inc. All rights reserved.
//

@import UIKit;

@protocol HorizontalSelectionListDataSource;
@protocol HorizontalSelectionListDelegate;

typedef NS_ENUM(NSInteger, HTHorizontalSelectionIndicatorStyle) {
    HTHorizontalSelectionIndicatorStyleBottomBar,           // Default
    HTHorizontalSelectionIndicatorStyleButtonBorder,
    HTHorizontalSelectionIndicatorStyleNone
};
@class HorizontalSelectionListCell;
@interface HorizontalSelectionList : UIView

@property (nonatomic) NSInteger selectedButtonIndex;        // returns selected button index. -1 if nothing selected
// to animate this change, use `-setSelectedButtonIndex:animated:`
// NOTE: this value will persist between calls to `-reloadData`

@property (nonatomic, weak) id<HorizontalSelectionListDataSource> dataSource;
@property (nonatomic, weak) id<HorizontalSelectionListDelegate> delegate;
///选中的底部的线
@property (nonatomic, strong) UIColor *selectionIndicatorColor;

///底部的线
@property (nonatomic, strong) UIColor *bottomTrimColor;
@property (nonatomic) BOOL showRightMaskView;
@property (nonatomic) BOOL bottomTrimHidden;                // Default is NO
/////10 一般用10
//@property (nonatomic) CGFloat leftSpace;
///20 一般用20
@property (nonatomic) CGFloat seperateSpace;
//@property (nonatomic) CGFloat rightSpace;

///每个按钮的edgeInsets
@property(nonatomic,assign)UIEdgeInsets sectionInset;
//@property (nonatomic) CGFloat topSpace;
//@property (nonatomic) CGFloat bottomSpace;

//@property (nonatomic,assign) BOOL selectionIndicatorBarHidden;
///自定义视图是否可以响应事件，默认为NO，如果可以响应，则selectionList:(HorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index; 不响应
@property(nonatomic,assign)BOOL contentViewUserInteractionEnabled;

///一屏最多显示个数,
@property(nonatomic,assign)NSInteger maxShowCount;
///default is 0,0的话会尽可能多的显示
@property(nonatomic,assign)NSInteger minShowCount;
@property(nonatomic,strong)UIFont* titleFont;
@property (nonatomic) HTHorizontalSelectionIndicatorStyle selectionIndicatorStyle;

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;
-(__kindof UICollectionViewCell*)dequeueReusableCellWithClass:(Class)class forIndex:(NSInteger)index isXIB:(BOOL)isXIB;
- (void)reloadData;

- (void)setSelectedItemIndex:(NSInteger)selectedItemIndex animated:(BOOL)animated;

@end

@protocol HorizontalSelectionListDataSource <NSObject>

- (NSInteger)numberOfItemsInSelectionList:(HorizontalSelectionList *)selectionList;

@optional
- (NSString *)selectionList:(HorizontalSelectionList *)selectionList titleForItemWithIndex:(NSInteger)index;
- (__kindof UICollectionViewCell *)selectionList:(HorizontalSelectionList *)selectionList viewForItemWithIndex:(NSInteger)index;

@end

@protocol HorizontalSelectionListDelegate <NSObject>

- (void)selectionList:(HorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index;



@end

