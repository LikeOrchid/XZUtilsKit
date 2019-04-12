//
//  ShrinkToolEventModel.h
//  FourDLShrinkage
//
//  Created by zong_xing on 2018/6/27.
//  Copyright © 2018年 zong_xing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^succesBlock)(NSString * value);
typedef void (^cancelBlick)(void);
@interface InputAlertTool : NSObject<UITextFieldDelegate,UIAlertViewDelegate>
+(instancetype)instance;
@property (nonatomic,strong)succesBlock success;
@property (nonatomic,strong)cancelBlick cancelBk;
//alert 带输入框
+(void)inputAlertWithTitle:(NSString *)title
               withMessage:(NSString *)message
           withPlaceholder:(NSString *)placeholder
               withSuccess:(succesBlock)success
                  withFail:(cancelBlick)cancelBk
             showInControl:(UIViewController*)contrl;
@end
