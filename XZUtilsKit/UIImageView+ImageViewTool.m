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
//得到图片的高
-(CGSize)getImageHeight{
    CGRect  iamgeAspectRect = AVMakeRectWithAspectRatioInsideRect(self.image.size, self.bounds);
    
    CGFloat scale = iamgeAspectRect.size.height/iamgeAspectRect.size.width;
    
    CGFloat hight = (self.frame.size.width - iamgeAspectRect.size.width)*scale+iamgeAspectRect.size.height;
    return CGSizeMake(self.frame.size.width, hight);
}
@end
