//
//  BaseCollectionViewCell.m
//  Machine
//
//  Created by zong_xing on 2018/12/7.
//  Copyright © 2018年 zong_xing. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect cellFrame = layoutAttributes.frame;
    if (self.EstimatedStyle == BaseCollectionViewCellEstimatedHidth) {
         cellFrame.size.height = size.height;
    }
    else if (self.EstimatedStyle == BaseCollectionViewCellEstimatedWidth){
        cellFrame.size.width = size.width;
    }
    else if (self.EstimatedStyle == BaseCollectionViewCellEstimatedFrame){
        cellFrame.size = size;
    }
    layoutAttributes.frame = cellFrame;
    return layoutAttributes;
}
@end
