//
//  BaseCollectionView.h
//  Machine
//
//  Created by zong_xing on 2018/12/7.
//  Copyright © 2018年 zong_xing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionView : UICollectionView
@property (nonatomic,assign) BOOL isSub;
@property (nonatomic, assign) BOOL vcCanScroll;
-(void)scrollViewDidScroll:(UIScrollView *)scrollView;
@end

NS_ASSUME_NONNULL_END
