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
-(CGFloat)readCacheSize;
- (void)clearFile;
@end
