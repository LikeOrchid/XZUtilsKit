//
//  UIViewController+VCCate.m
//  XZUtilsKitDemo
//
//  Created by yanyu on 2019/4/19.
//  Copyright © 2019 yanyu. All rights reserved.
//

#import "UIViewController+VCCate.h"

@implementation UIViewController (VCCate)
-(void)showAlertTitle:(NSString*)title
              withMsg:(NSString *)message
          withSuccess:(void(^)(void))success
           withCancel:(void(^)(void))cancel{
    UIAlertController * alert =[UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
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
@end
