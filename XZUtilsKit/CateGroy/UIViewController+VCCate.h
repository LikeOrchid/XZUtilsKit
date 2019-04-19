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
-(void)showAlertTitle:(NSString*)title
              withMsg:(NSString *)message
          withSuccess:(void(^)(void))success
           withCancel:(void(^)(void))cancel;
@end

NS_ASSUME_NONNULL_END
