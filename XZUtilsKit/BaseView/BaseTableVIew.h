//
//  BaseTableVIew.h
//  Machine
//
//  Created by zong_xing on 2018/12/7.
//  Copyright © 2018年 zong_xing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableView : UITableView<UIGestureRecognizerDelegate>
@property (nonatomic, assign) BOOL canScroll;
@property (nonatomic,assign) BOOL isSub;
@property (nonatomic, assign) BOOL vcCanScroll;
-(void)scrollViewDidScroll:(UIScrollView *)scrollView;
-(void)scrollViewDidScroll:(UIScrollView *)scrollView withMargin:(CGFloat)offset subView:(UIView*)subview;
@end

NS_ASSUME_NONNULL_END
