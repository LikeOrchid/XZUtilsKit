//  Created by zong_xing on 2018/4/4.
//  Copyright © 2018年 zong_xing. All rights reserved.
//

//初始化
//-(NavReplaceView *)navView{
//    if (!_navView) {
//        _navView = [[NavReplaceView alloc]initWithFrame:CGRectZero];
//        _navView.nav_color = [UIColor orangeColor];
//        _navView.isFrist = YES
//        _navView.setupalpha = 0;
//    }
//    return _navView;
//}
// ====UINavigationItem * navigationItem;   UINavigationBar * navBar;与系统的用法一致===
//self.navView.navigationItem.leftBarButtonItem = rightItem;
//[backBtn addTarget:self action:@selector(backButtonTouch) forControlEvents:UIControlEventTouchUpInside];


/* 最外层，也就是nav 的第一个控制器内 加上要隐藏的 calss 就行
#pragma mark - UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([viewController isKindOfClass:<#calss#>]) {
        [<#VC#>.navigationController setNavigationBarHidden:YES animated:YES];
    }else{
        [<#VC#>.navigationController setNavigationBarHidden:NO animated:YES];
    }
}
 
 [self.table addSubview:self.navView.spaceView];
 [self.table sendSubviewToBack:self.navView.spaceView];
 
*/


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NavReplaceView : UIView<UINavigationControllerDelegate>
//当导航栏透明时再往下拉的替换拉升视图  添加到父视图
@property(nonatomic,strong)UIView *spaceView;
//假状态视图
@property (nonatomic,strong)UIView * statusView;
//假背景色视图
@property (nonatomic,strong)UIView * backView;

@property (nonatomic,strong)UINavigationBar * navBar;
@property (nonatomic,strong)UINavigationItem * navigationItem;

@property (nonatomic,assign)CGFloat setupalpha; //当前透明度
@property (nonatomic,assign)CGFloat noteAlpha; //跳转页面的时候使用
@property (nonatomic,strong)UIColor *nav_color; //导航栏颜色

@property (nonatomic,assign)BOOL isFrist; //是否是初始化时 ，同 onFristInitAlaph调用
@property (nonatomic,assign)BOOL topSpace; //是否使用顶部拉伸视图

/**
 根据距离改变透明图
 用法：
 -(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat margin = 150;
    [self.navView setupAlphaAtScrollView:scrollView withMargin:margin];
 }
 @param scrollView 滚动视图
 @param margin 变化的范围
 */
-(void)setupAlphaAtScrollView:(UIScrollView *)scrollView withMargin:(CGFloat)margin;

/**初始化透明度
用法：
// -(void)viewWillAppear:(BOOL)animated{
//     [super viewWillAppear:animated];
//     //初始化侵入式 替换的导航栏视图
//     [self.navView onFristInitAlaph];
//     [self.navView showInView:self.view];
// }
 */
-(void)onFristInitAlaph;
/**
显示到视图上
 */
-(void)showInView:(UIView*)sview;

/**
 添加渐变层
 */
-(void)addGradientLayer;

@end
