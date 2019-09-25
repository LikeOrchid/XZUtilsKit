//
//  UIViewController+VCCate.h
//  XZUtilsKitDemo
//
//  Created by yanyu on 2019/4/19.
//  Copyright © 2019 yanyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (VCCate)
/**
 *  MARK:确认和取消的提示框
 */
-(void)showAlertTitle:(NSString*)title
              withMsg:(NSString *)message
          withSuccess:(void(^)(void))success
           withCancel:(void(^)(void))cancel;
/**
 *   MARK:按钮文字自定义的 确认和取消的提示框
 */
-(void)showAlertTitle:(NSString*)title
              withMsg:(NSString *)message
       withConfrimStr:(NSString *)confrimstr
        withCancelStr:(NSString *)cancelStr
          withSuccess:(void(^)(void))success
           withCancel:(void(^)(void))cancel;
/**
 *   MARK:只有一个按钮的 按钮文字自定义的 确认和取消的提示框
 */
-(void)showAlertTitle:(NSString*)title
              withMsg:(NSString *)message
       withConfrimStr:(NSString *)confrimstr
          withSuccess:(void(^)(void))success;

/**
 *   MARK:sheet 提示框
 */
-(void)showSheetTitle:(NSString *)title
              withMsg:(NSString *)message
             withBtns:(NSArray<NSString *> *)btnTitles
          withSuccess:(void(^)(NSInteger index))success;
@end

NS_ASSUME_NONNULL_END
