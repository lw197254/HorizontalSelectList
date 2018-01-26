//
//  HozizontalSelectionList.m
//  HoriztalList
//
//  Created by 刘伟 on 2017/8/14.
//  Copyright © 2017年 万圣伟业. All rights reserved.
//

#import "HorizontalSelectionList.h"
#import "HorizontalSelectionListCell.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "AACollectionViewCell.h"
#define kwidth [UIScreen mainScreen].bounds.size.width

#define separateSpaceDefaultValue 20
#define leftSpaceDefaultValue 10
#define rightSpaceDefaultValue 20

///系统layout默认的 minimumLineSpacing,minimumInteritemSpacing 值都为10
#define  defaultMinimumLineSpacing 10
#define  defaultMinimumInteritemSpacing 10


@interface HorizontalSelectionList ()<UICollectionViewDataSource,UICollectionViewDelegateLeftAlignedLayout>


@property (nonatomic, assign) NSInteger itemNumber;
///右边表示还有栏目的遮盖图，有栏目就灰色，没有栏目就透明
@property (nonatomic, strong) UIImageView *rightMaskView;

@property (nonatomic, strong) NSMutableDictionary<NSString*,UIColor*> *buttonColorsByState;
@property (nonatomic, strong)UICollectionViewLeftAlignedLayout*layout;
@property (nonatomic, strong) UICollectionView *collectionView;

@end


@implementation HorizontalSelectionList

-(void)awakeFromNib{
    [super awakeFromNib];
    [self configUI];
}
-(void)registerClass:(Class)class forHorizontalSelectionListCellWithReuserIdentifier:(NSString*)reuserIdntifier{
    [self.collectionView registerClass:class forCellWithReuseIdentifier:reuserIdntifier];
}
-(void)registerNib:(UINib*)nib forHorizontalSelectionListCellWithReuserIdentifier:(NSString*)resuerIdentifier{
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:resuerIdentifier];
    
}
-(void)setTitleColor:(UIColor *)color forState:(UIControlState)state{
    [self.buttonColorsByState setObject:color forKey:[NSNumber numberWithInteger:state]];
}
-(instancetype)init{
    if (self = [super init]) {
       
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        [self configUI];
        
    }
    return self;
}
-(void)configUI{
    
    self.seperateSpace = separateSpaceDefaultValue;
    if ( UIEdgeInsetsEqualToEdgeInsets(self.sectionInset, UIEdgeInsetsZero)) {
        self.sectionInset = UIEdgeInsetsMake(0, leftSpaceDefaultValue, 0, rightSpaceDefaultValue);
    }
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
   
    [self addSubview:self.collectionView];
    [self.collectionView registerClass:[HorizontalSelectionListCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"AACollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Acell"];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}
-(void)reloadData{
    [self updateItemCount];
         self.layout.sectionInset =UIEdgeInsetsMake(self.sectionInset.top, self.sectionInset.left, self.sectionInset.bottom, self.sectionInset.right);
//     self.layout.sectionInset =UIEdgeInsetsMake(self.sectionInset.top, self.sectionInset.left, self.sectionInset.bottom, self.sectionInset.right+(self.itemNumber-1)*(self.seperateSpace-defaultMinimumLineSpacing+defaultMinimumInteritemSpacing-self.layout.minimumInteritemSpacing));
    
//    [self.collectionView.collectionViewLayout invalidateLayout];
    [self.collectionView reloadData];
}
-(void)insertItemAtIndexes:(NSArray<NSNumber*>*)indexes{
    [self updateItemCount];
    [self.collectionView performBatchUpdates:^{
        NSMutableArray*array = [NSMutableArray array];
        for (NSNumber*number in indexes) {
            NSIndexPath*index = [NSIndexPath indexPathForRow:[number integerValue] inSection:0];
            [array addObject:index];
        }
        
        [self.collectionView insertItemsAtIndexPaths:array];
        
    } completion:nil];
}

-(void)deleteItemAtIndexes:(NSArray<NSNumber*>*)indexes{
    [self updateItemCount];
    [self.collectionView performBatchUpdates:^{
        NSMutableArray*array = [NSMutableArray array];
        for (NSNumber*number in indexes) {
            NSIndexPath*index = [NSIndexPath indexPathForRow:[number integerValue] inSection:0];
            [array addObject:index];
        }
        
        [self.collectionView deleteItemsAtIndexPaths:array];
        
    } completion:nil];
}

-(void)updateItemCount{
    if ([self.dataSource respondsToSelector:@selector(numberOfItemsInSelectionList:)]) {
        self.itemNumber = [self.dataSource numberOfItemsInSelectionList:self];
    }else{
        self.itemNumber = 0;
    }
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
   
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.itemNumber;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if ([self.dataSource respondsToSelector:@selector(selectionList:viewForItemWithIndex:)]) {
        return [self.dataSource selectionList:self viewForItemWithIndex:indexPath.row];
    }else{
        HorizontalSelectionListCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        [self.buttonColorsByState enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, UIColor * _Nonnull obj, BOOL * _Nonnull stop) {
            [cell.titleButton setTitleColor:obj forState:[key integerValue]];
        }];
      
        if(self.titleFont){
            cell.titleButton.titleLabel.font = self.titleFont;
        }

        cell.title = [self.dataSource selectionList:self titleForItemWithIndex:indexPath.row];
        return cell;
    }
    
}
-(__kindof UICollectionViewCell*)dequeueReusableCellWithClass:(Class)class forIndex:(NSInteger)index isXIB:(BOOL)isXIB{
    if (isXIB) {
       [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(class) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(class)];
    }else{
        [self.collectionView registerClass:class forCellWithReuseIdentifier:NSStringFromClass(class)];
    }
    UICollectionViewCell*cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(class) forIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(selectionList:didSelectItemWithIndex:)]) {
        [self.delegate selectionList:self didSelectItemWithIndex:indexPath.row];
    }
}

- (void)setSelectedItemIndex:(NSInteger)selectedItemIndex animated:(BOOL)animated{
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:selectedItemIndex inSection:0] animated:animated scrollPosition:UICollectionViewScrollPositionLeft];
    self.selectedButtonIndex = selectedItemIndex;
}

-(void)setSeperateSpace:(CGFloat)seperateSpace{
    if (_seperateSpace!=seperateSpace) {
        _seperateSpace = seperateSpace;
        self.layout.minimumLineSpacing = seperateSpace;
    }
}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake(100, 240);
//}
-(UICollectionView*)collectionView{
    if (!_collectionView) {
        self.layout.minimumLineSpacing = self.seperateSpace;
        self.layout.minimumInteritemSpacing = 10;
    ///第一个
//        self.layout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
//        self.layout.sectionInset =UIEdgeInsetsMake(self.sectionInset.top, self.sectionInset.left, self.sectionInset.bottom, self.sectionInset.right+(self.itemNumber-1)*(self.seperateSpace-defaultMinimumLineSpacing+defaultMinimumInteritemSpacing-self.layout.minimumInteritemSpacing));
        ///这个大小只要部位CGSizeZero就可以
       
//        self.layout.estimatedItemSize = CGSizeMake(30,30);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _collectionView.directionalLockEnabled = YES;
        if ([_collectionView respondsToSelector:@selector(setPrefetchingEnabled:)]) {
            _collectionView.prefetchingEnabled = false;
        }
    }
    
    
    return _collectionView;
}
-(UICollectionViewFlowLayout*)layout{
    if (!_layout) {
        _layout = [[UICollectionViewLeftAlignedLayout alloc]init];
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
    }
    return _layout;
    
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(30, 30);
}
-(NSMutableDictionary<NSString*,UIColor*>*)buttonColorsByState{
    if (!_buttonColorsByState) {
        _buttonColorsByState = [[NSMutableDictionary<NSString*,UIColor*> alloc]init];
    }
    return _buttonColorsByState;
}
@end
