//
//  VCBase+VCBaseCate.m
//  OwenStaffIOS
//
//  Created by zong_xing on 2019/4/2.
//  Copyright © 2019年 yanyu. All rights reserved.
//

#import "VCBase+VCBaseCate.h"

@implementation VCBase (VCBaseCate)
-(void)showAlert:(NSString *)message
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
