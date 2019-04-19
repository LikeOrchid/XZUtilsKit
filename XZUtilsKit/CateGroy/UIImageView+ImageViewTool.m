//
//  UIImageView+ImageViewTool.m
//  JinQian
//
//  Created by Toommi on 2017/11/8.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import "UIImageView+ImageViewTool.h"
#import <AVFoundation/AVFoundation.h>
@implementation UIImageView (ImageViewTool)
/**
 在对 UIImageView 的image 赋值之后 得到图片内容的高
 
 @return size
 */
-(CGSize)getImageHeight{
    CGRect  iamgeAspectRect = AVMakeRectWithAspectRatioInsideRect(self.image.size, self.bounds);
    
    CGFloat scale = iamgeAspectRect.size.height/iamgeAspectRect.size.width;
    
    CGFloat hight = (self.frame.size.width - iamgeAspectRect.size.width)*scale+iamgeAspectRect.size.height;
    return CGSizeMake(self.frame.size.width, hight);
}
@end
