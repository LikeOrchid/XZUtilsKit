//
//  BaseCollectionViewCell.h
//  Machine
//
//  Created by zong_xing on 2018/12/7.
//  Copyright © 2018年 zong_xing. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,BaseCollectionViewCellEstimateStyle){
    BaseCollectionViewCellEstimatedHidth,
    BaseCollectionViewCellEstimatedWidth,
    BaseCollectionViewCellEstimatedFrame,
    BaseCollectionViewCellEstimatedNone
};
NS_ASSUME_NONNULL_BEGIN
@interface BaseCollectionViewCell : UICollectionViewCell
@property(nonatomic,assign)BaseCollectionViewCellEstimateStyle EstimatedStyle;
@end

NS_ASSUME_NONNULL_END
