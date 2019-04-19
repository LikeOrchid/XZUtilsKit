//
//  UIImageView+ImageViewTool.h
//  JinQian
//
//  Created by Toommi on 2017/11/8.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ImageViewTool)

/**
 在对 UIImageView 的image 赋值之后 得到图片内容的高

 @return size
 */
-(CGSize)getImageHeight;
@end
