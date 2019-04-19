//
//  ShrinkToolEventModel.m
//  FourDLShrinkage
//
//  Created by zong_xing on 2018/6/27.
//  Copyright © 2018年 zong_xing. All rights reserved.
//

#import "InputAlertTool.h"
@implementation InputAlertTool
static  InputAlertTool*_instance = nil;
+(instancetype)instance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance =[[self alloc]init];
    });
    return _instance;
}
#pragma mark-修改文字信息
/**
 alert 带输入框 兼容 8.0-9.0
 
 @param title 标题
 @param message 描述
 @param placeholder 输入框的
 @param success 成功回调
 @param cancelBk 取消回调
 @param contrl 控制器
 */
+(void)inputAlertWithTitle:(NSString *)title withMessage:(NSString *)message withPlaceholder:(NSString *)placeholder withSuccess:(succesBlock)success withFail:(cancelBlick)cancelBk showInControl:(UIViewController*)contrl{
    if (@available(iOS 9.0, *)) {
        
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
         [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                textField.delegate = [InputAlertTool instance];
                textField.placeholder = placeholder;
        }];
        UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelBk) {
                cancelBk();
            }
        }];
        
        UIAlertAction * confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UITextField * filed = alert.textFields[0];
            if (success) {
                success(filed.text);
            }
        }];
        [alert addAction:cancel];
        [alert addAction:confirm];
        [contrl presentViewController:alert animated:YES completion:nil];
    }else{
        
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
        UITextField *textField = [alert textFieldAtIndex:0];
        textField.delegate = [InputAlertTool instance];
        
        textField.placeholder = placeholder;
        
        [alert show];
        if (success) {
            [InputAlertTool instance].success=success;
        }
        if (cancelBk) {
            [InputAlertTool instance].cancelBk = cancelBk;
        }
        
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        UITextField *txt = [alertView textFieldAtIndex:0];
        if (self.success) {
            self.success(txt.text);
        }
        
    }else{
        if (self.cancelBk) {
            self.cancelBk();
        }
    }
}

@end
