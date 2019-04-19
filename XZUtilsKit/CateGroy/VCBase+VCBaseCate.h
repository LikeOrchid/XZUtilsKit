//
//  VCBase+VCBaseCate.h
//  OwenStaffIOS
//
//  Created by zong_xing on 2019/4/2.
//  Copyright © 2019年 yanyu. All rights reserved.
//

#import "VCBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface VCBase (VCBaseCate)
-(void)showAlert:(NSString *)message
     withSuccess:(void(^)(void))success
      withCancel:(void(^)(void))cancel;
@end

NS_ASSUME_NONNULL_END
