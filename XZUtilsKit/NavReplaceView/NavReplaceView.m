//
//  HomeNavReplaceView.m
//  FlyingDogTwo
//
//  Created by zong_xing on 2018/4/4.
//  Copyright © 2018年 zong_xing. All rights reserved.
//

#import "NavReplaceView.h"
#import "UIView+XZExtension.h"
///屏幕宽度
#define SCREEN_W  [UIScreen mainScreen].bounds.size.width
///屏幕高度
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

@implementation NavReplaceView
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_W, kTopHeight)];
    if (self) {
        self.nav_color = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
    }
    return  self;
}
#pragma mark -getter
-(UIView *)spaceView{
    if (!_spaceView) {
        _spaceView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 0)];
        _spaceView.backgroundColor = _nav_color;
        _spaceView.hidden = YES;
    }
    return _spaceView;
}
-(UIView *)statusView {
    if (!_statusView) {
        _statusView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, kStatusBarHeight)];
        _statusView.backgroundColor = _nav_color;
    }
    return _statusView;
}
-(UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, kStatusBarHeight, SCREEN_W, kNavBarHeight)];
        _backView.backgroundColor = _nav_color;
    }
    return _backView;
}
-(UINavigationBar *)navBar{
    if (!_navBar) {
        _navBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, kStatusBarHeight, SCREEN_W, kNavBarHeight)];
        [_navBar pushNavigationItem:self.navigationItem animated:YES];
        [self setNavBarbackImage:_navBar withColor:[UIColor clearColor]]; //背景图片有 在跳转暂时有不可控性，暂时用替代视图
    }
    return _navBar;
}
-(UINavigationItem *)navigationItem {
    if (!_navigationItem) {
        _navigationItem = [[UINavigationItem alloc]initWithTitle:@""];
    }
    return _navigationItem;
}
#pragma mark -setter

-(void)setSetupalpha:(CGFloat)setupalpha {
    _setupalpha = setupalpha;
    self.statusView.alpha = setupalpha;
    self.backView.alpha = setupalpha;
    if (!setupalpha) {
//        [self dropShadowWithOffset:CGSizeMake(0, 0.7) radius:1 color:[UIColor grayColor] opacity:0.4];
    }else {
        [self dropShadowWithOffset:CGSizeMake(0, 0.7) radius:1 color:[UIColor clearColor] opacity:0.4];
    }
    
}

-(void)setNav_color:(UIColor *)nav_color{
    _nav_color = nav_color;
    self.statusView.backgroundColor = nav_color;
    self.backView.backgroundColor = nav_color;
    self.spaceView.backgroundColor = _nav_color;
}

-(void)setTopSpace:(BOOL)topSpace{
    _topSpace =topSpace;
    self.spaceView.hidden = !topSpace;
}

#pragma mark -method

-(void)layoutSubviews {
    [super layoutSubviews];
    //其实statusView 和 backView可以合并 ，但是想区分开
    [self addSubview:self.statusView];
    [self addSubview:self.backView];
    
    [self addSubview:self.navBar];
}
-(void)setNavBarbackImage:(UINavigationBar *)baigationBar withColor:(UIColor *)color{
    UIImage * Image = [self createImageWithColor:color];
    [baigationBar setBackgroundImage:Image forBarMetrics:UIBarMetricsDefault];
    [baigationBar setShadowImage:Image];
}
//设置阴影
- (void)dropShadowWithOffset:(CGSize)offset radius:(CGFloat)radius color:(UIColor *)color opacity:(CGFloat)opacity {
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.navBar.bounds);
    self.navBar.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    
    self.navBar.layer.shadowColor = color.CGColor;
    self.navBar.layer.shadowOffset = offset;
    self.navBar.layer.shadowRadius = radius;
    self.navBar.layer.shadowOpacity = opacity;
    
    self.navBar.clipsToBounds = NO;
}
-(void)setupAlphaAtScrollView:(UIScrollView *)scrollView withMargin:(CGFloat)margin {
    CGFloat minAlphaOffset = 0;
    CGFloat maxAlphaOffset = margin;// -kTopHeight -15;
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    //是否是第一次创建
    NSLog(@"透明度：%f",alpha);
    self.setupalpha = alpha;
    self.noteAlpha = alpha;
    if (offset >= maxAlphaOffset) {
        
    }else{
        
    }
    
    //顶部拉伸视图  加 SCREEN_H 防止下拉刷新闪白屏
    CGFloat spaceOffset = offset<0?fabs(offset):0;
    self.spaceView.height =spaceOffset+SCREEN_H;
    self.spaceView.y = -spaceOffset-SCREEN_H;
    
    NSLog(@"位置:%f-->%f",spaceOffset+SCREEN_H,-spaceOffset-SCREEN_H);
}

-(void)onFristInitAlaph{
    if (self.isFrist ==1) {
        self.setupalpha  = .001;
        self.isFrist = 0;
    }
}
-(void)showInView:(UIView*)sview {
    //是否使用假导航栏的拉升视图 顺序1
       if (self.topSpace) {
           UIView *scroll = nil;
           //显示在有滚动属性的 同一级
           for (UIView *view in sview.subviews) {
               if ([view isKindOfClass:[UITableView class]]||
                   [view isKindOfClass:[UICollectionView class]]||
                   [view isKindOfClass:[UIScrollView class]]) {
                   scroll =view;
               }
           }
           if (scroll) {
               //背景拉伸视图
               if (![scroll.subviews containsObject:self.spaceView]) {
                    [scroll addSubview:self.spaceView];
                    [scroll sendSubviewToBack:self.spaceView];
               }
           }else{
               NSLog(@"没有滚动视图");
           }
           
       }
       
       //是否需要假导航栏  顺序2  navView 要在 spaceView上面
       //假导航栏视图视图
       if ([sview.subviews containsObject:self]) {
           [sview bringSubviewToFront:self];
       }else{
           [sview addSubview:self];
       }
}
/**
 --根据颜色创建图片
 
 @param color 颜色
 @return uiimage
 */
- (UIImage*)createImageWithColor:(UIColor*)color{
    
    CGRect rect=CGRectMake(0.0f,0.0f,1.0f,1.0f);UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context=UIGraphicsGetCurrentContext();CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage*theImage=UIGraphicsGetImageFromCurrentImageContext();UIGraphicsEndImageContext();
    return theImage;
}
/**
 添加渐变层
 */
-(void)addGradientLayer {
    [self.statusView.layer addSublayer:[self gradientLayer]];
    [self.backView.layer addSublayer: [self gradientLayer]];
}
-(CAGradientLayer *)gradientLayer {
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,SCREEN_W,kTopHeight);
    gl.startPoint = CGPointMake(0, 1);
    gl.endPoint = CGPointMake(1, 1);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:64/255.0 green:137/255.0 blue:234/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:35/255.0 green:92/255.0 blue:169/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0),@(1.0f)];
    return gl;
}

@end
