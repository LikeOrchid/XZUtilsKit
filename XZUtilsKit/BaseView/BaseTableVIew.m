//
//  BaseTableVIew.m
//  Machine
//
//  Created by zong_xing on 2018/12/7.
//  Copyright © 2018年 zong_xing. All rights reserved.
//

#import "BaseTableView.h"
#import "BaseCollectionView.h"
@implementation BaseTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.canScroll = YES;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollStatus) name:@"leaveTop" object:nil];
    }
    return self;
}

#pragma mark notify
- (void)changeScrollStatus//改变主视图的状态
{
    self.canScroll = YES;
}
#pragma mark - UIGestureRecognizerdelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView withMargin:(CGFloat)offset subView:(UIView*)subview{
    if (scrollView.contentOffset.y >= offset) {
        scrollView.contentOffset = CGPointMake(0, offset);
        if (self.canScroll) {
            self.canScroll = NO;
            if ([subview isKindOfClass:[UICollectionView class]]) {
                BaseCollectionView * basecview =(BaseCollectionView *)subview;
                 basecview.vcCanScroll = YES;
            }
            else if ([subview isKindOfClass:[UITableView class]]){
                BaseTableView * basecview =(BaseTableView *)subview;
                basecview.vcCanScroll = YES;
            }
        }
                      
    }else{
        if (!self.canScroll) {//子视图没到顶部
            scrollView.contentOffset = CGPointMake(0, offset);
        }
    }
    self.showsVerticalScrollIndicator = _canScroll?YES:NO;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.isSub) {
        if (!self.vcCanScroll) {
            scrollView.contentOffset = CGPointZero;
        }
        if (scrollView.contentOffset.y <= 0) {
            
            self.vcCanScroll = NO;
            scrollView.contentOffset = CGPointZero;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"leaveTop" object:nil];//到顶通知父视图改变状态
        }
        self.showsVerticalScrollIndicator = _vcCanScroll?YES:NO;
    }
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
