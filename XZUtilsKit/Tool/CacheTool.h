//
//  CacheTool.h
//  HomePepair
//
//  Created by zong_xing on 2018/7/19.
//  Copyright © 2018年 zong_xing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CacheTool : NSObject

/**
 得到缓存大小

 @return 大小
 */
-(CGFloat)readCacheSize;

/**
 清除缓存
 */
- (void)clearFile;
@end
