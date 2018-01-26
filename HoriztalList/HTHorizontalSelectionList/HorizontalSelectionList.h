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

///两个按钮距离，默认值为20
@property (nonatomic) CGFloat seperateSpace;


///每个按钮的edgeInsets
@property(nonatomic,assign)UIEdgeInsets sectionInset;


//@property (nonatomic,assign) BOOL selectionIndicatorBarHidden;
///自定义视图是否可以响应事件，默认为NO，如果可以响应，则selectionList:(HorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index; 不响应
@property(nonatomic,assign)BOOL contentViewUserInteractionEnabled;


@property(nonatomic,strong)UIFont* titleFont;
@property (nonatomic) HTHorizontalSelectionIndicatorStyle selectionIndicatorStyle;


- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;
-(__kindof UICollectionViewCell*)dequeueReusableCellWithClass:(Class)class forIndex:(NSInteger)index isXIB:(BOOL)isXIB;
- (void)reloadData;

- (void)setSelectedItemIndex:(NSInteger)selectedItemIndex animated:(BOOL)animated;

///插入元素
-(void)insertItemAtIndexes:(NSArray<NSNumber*>*)indexes;
///删除元素
-(void)deleteItemAtIndexes:(NSArray<NSNumber*>*)indexes;
@end

@protocol HorizontalSelectionListDataSource <NSObject>

- (NSInteger)numberOfItemsInSelectionList:(HorizontalSelectionList *)selectionList;

@optional
///两者选一个
- (NSString *)selectionList:(HorizontalSelectionList *)selectionList titleForItemWithIndex:(NSInteger)index;

- (__kindof UICollectionViewCell *)selectionList:(HorizontalSelectionList *)selectionList viewForItemWithIndex:(NSInteger)index;

@end

@protocol HorizontalSelectionListDelegate <NSObject>
@optional
- (void)selectionList:(HorizontalSelectionList *)selectionList didSelectItemWithIndex:(NSInteger)index;


@end

