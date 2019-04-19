//
//  BaseCollectionView.m
//  Machine
//
//  Created by zong_xing on 2018/12/7.
//  Copyright © 2018年 zong_xing. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.isSub) {
        if (!self.vcCanScroll) {
            scrollView.contentOffset = CGPointZero;
        }
    
        if (scrollView.contentOffset.x<1||scrollView.contentOffset.x>0) {
            scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
        }
        
        if (scrollView.contentOffset.y <= 0) {
            
            self.vcCanScroll = NO;
            scrollView.contentOffset = CGPointZero;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"leaveTop" object:nil];//到顶通知父视图改变状态
        }
        self.showsVerticalScrollIndicator = _vcCanScroll?YES:NO;
    }
}
@end
