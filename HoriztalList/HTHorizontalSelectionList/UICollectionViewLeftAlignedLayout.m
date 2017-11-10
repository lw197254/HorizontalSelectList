
// Copyright (c) 2014 Giovanni Lodi
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "UICollectionViewLeftAlignedLayout.h"

@interface UICollectionViewLayoutAttributes (LeftAligned)

- (void)leftAlignFrameWithSectionInset:(UIEdgeInsets)sectionInset;

@end

@implementation UICollectionViewLayoutAttributes (LeftAligned)



@end

#pragma mark -

@implementation UICollectionViewLeftAlignedLayout

#pragma mark - UICollectionViewLayout


///自动适应的情况 contentsize计算的不对，这里重新计算，该方法仅适用只有一个section的情况
-(CGSize)collectionViewContentSize{
 CGSize size =  [super collectionViewContentSize];
    ///如果没使用自动适应大小，那么contentsize的大小计算是没有问题的
    if (CGSizeEqualToSize(self.estimatedItemSize, CGSizeZero)) {
        return size;
    }
    
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]) {
         id<UICollectionViewDelegateLeftAlignedLayout> delegate = (id<UICollectionViewDelegateLeftAlignedLayout>)self.collectionView.delegate;
        self.minimumLineSpacing = [delegate collectionView:self.collectionView layout:self minimumLineSpacingForSectionAtIndex:0];
    }
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
        id<UICollectionViewDelegateLeftAlignedLayout> delegate = (id<UICollectionViewDelegateLeftAlignedLayout>)self.collectionView.delegate;
        self.minimumInteritemSpacing = [delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:0];
    }
 
//    size.height = size.height +(-10 +self.minimumInteritemSpacing)*([self.collectionView.dataSource collectionView:self.collectionView numberOfItemsInSection:0]-1);
    size.width = size.width +(self.minimumLineSpacing -self.minimumInteritemSpacing)*([self.collectionView.dataSource collectionView:self.collectionView numberOfItemsInSection:0]-1);

    return size;
    
}

@end
