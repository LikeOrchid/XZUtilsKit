//
//  UIViewController+VCCate.m
//  XZUtilsKitDemo
//
//  Created by yanyu on 2019/4/19.
//  Copyright © 2019 yanyu. All rights reserved.
//

#import "UIViewController+VCCate.h"

@implementation UIViewController (VCCate)
/**
 *   MARK:确认和取消的提示框
 */
-(void)showAlertTitle:(NSString*)title
              withMsg:(NSString *)message
          withSuccess:(void(^)(void))success
           withCancel:(void(^)(void))cancel{
    UIAlertController * alert =[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancel) {
            cancel();
        }
    }];
    UIAlertAction * confrimAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (success) {
            success();
        }
    }];
    [alert addAction:cancelAction];
    [alert addAction:confrimAction];
    [self presentViewController:alert animated:YES completion:nil];
}

/**
 *   MARK:按钮文字自定义的 确认和取消的提示框
 */
-(void)showAlertTitle:(NSString*)title
              withMsg:(NSString *)message
       withConfrimStr:(NSString *)confrimstr
        withCancelStr:(NSString *)cancelStr
          withSuccess:(void(^)(void))success
           withCancel:(void(^)(void))cancel{
    UIAlertController * alert =[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:cancelStr style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancel) {
            cancel();
        }
    }];
    UIAlertAction * confrimAction = [UIAlertAction actionWithTitle:confrimstr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (success) {
            success();
        }
    }];
    [alert addAction:cancelAction];
    [alert addAction:confrimAction];
    [self presentViewController:alert animated:YES completion:nil];
}
/**
 *   MARK:只有一个按钮的 按钮文字自定义的 确认和取消的提示框
 */
-(void)showAlertTitle:(NSString*)title
              withMsg:(NSString *)message
       withConfrimStr:(NSString *)confrimstr
          withSuccess:(void(^)(void))success{
    UIAlertController * alert =[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * confrimAction = [UIAlertAction actionWithTitle:confrimstr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (success) {
            success();
        }
    }];
    [alert addAction:confrimAction];
    [self presentViewController:alert animated:YES completion:nil];
}


/**
 *   MARK:sheet 提示框
 */
-(void)showSheetTitle:(NSString *)title
              withMsg:(NSString *)message
             withBtns:(NSArray<NSString *> *)btnTitles
          withSuccess:(void(^)(NSInteger index))success{
    UIAlertController * alert =[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (NSString * actionTitle in btnTitles) {
        UIAlertAction * confrimAction = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
               if (success) {
                   NSInteger index = [btnTitles indexOfObject:action.title];
                   success(index);
               }
           }];
        [alert addAction:confrimAction];
    }

    [self presentViewController:alert animated:YES completion:nil];
}
@end
