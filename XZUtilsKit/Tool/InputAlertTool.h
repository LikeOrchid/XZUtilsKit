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
/**
 alert 带输入框 兼容 8.0-9.0

 @param title 标题
 @param message 描述
 @param placeholder 输入框的
 @param success 成功回调
 @param cancelBk 取消回调
 @param contrl 控制器
 */
+(void)inputAlertWithTitle:(NSString *)title
               withMessage:(NSString *)message
           withPlaceholder:(NSString *)placeholder
               withSuccess:(succesBlock)success
                  withFail:(cancelBlick)cancelBk
             showInControl:(UIViewController*)contrl;
@end
