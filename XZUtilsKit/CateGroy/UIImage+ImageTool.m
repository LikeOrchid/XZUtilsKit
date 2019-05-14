//
//  UIImage+ImageTool.m
//  FlyingDog
//
//  Created by Toommi on 2017/7/22.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import "UIImage+ImageTool.h"
#import <Accelerate/Accelerate.h>
@implementation UIImage (ImageTool)
/**
 --根据颜色创建图片
 
 @param color 颜色
 @return uiimage
 */
+ (UIImage*)createImageWithColor:(UIColor*)color{
    
    CGRect rect=CGRectMake(0.0f,0.0f,1.0f,1.0f);UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context=UIGraphicsGetCurrentContext();CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage*theImage=UIGraphicsGetImageFromCurrentImageContext();UIGraphicsEndImageContext();
    return theImage;
}
/**
 --改变图片的大小
 
 @param image 图片
 @param size 指定的size
 @return image
 */
+(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

/**
 --添加通用模糊效果
 vImage属于Accelerate.Framework，需要导入 Accelerate下的 Accelerate头文件
 
 @param image 图片
 @param blur 是模糊度
 @return image
 */
+ (UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur
{
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    CGImageRef img = image.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    
    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    //设置从CGImage获取对象的属性
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if(error){
        NSLog(@"error from convolution %ld", error);
    }
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate( outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorSpace, kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up CGContextRelease(ctx)
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}

/**
 --通过 data 设置图片
 
 @param data 数据流
 @param placeImage 替换图片
 @return image
 */
+(UIImage *)setDataImage:(NSData *)data placeher:(UIImage *)placeImage {
    UIImage * Image;
    if (data.length > 0) {
        Image = [UIImage imageWithData:data];
    }else{
        Image = placeImage;
    }
    return Image;
}
/**
 --生成圆角
 
 @param cornerRadius 圆角大小
 @return image
 */
-(UIImage *)imageWithRoundedCornersSize:(float)cornerRadius
{
    UIImage *original = self;
    CGRect frame = CGRectMake(0, 0, original.size.width, original.size.height);
    // 开始一个Image的上下文
    UIGraphicsBeginImageContextWithOptions(original.size, NO, 1.0);
    // 添加圆角
    [[UIBezierPath bezierPathWithRoundedRect:frame
                                cornerRadius:cornerRadius] addClip];
    // 绘制图片
    [original drawInRect:frame];
    // 接受绘制成功的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 --根据文字生成图片
 
 @param name 字符
 @return image
 */
+ (UIImage *)getTextImage:(NSString *)name
{
    UIColor *color = [self randomColor];  //获取随机颜色
    CGRect rect = CGRectMake(0.0f, 0.0f, 50, 50);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    NSString * headerName = [name substringFromIndex:0];
    UIImage *headerimg = [self imageToAddText:img withText:headerName];
    return headerimg;
}

//随机颜色
+ (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


+ (UIImage *)imageToAddText:(UIImage *)img withText:(NSString *)text
{
    //1.获取上下文
    UIGraphicsBeginImageContext(img.size);
    //2.绘制图片
    [img drawInRect:CGRectMake(0, 0, img.size.width, img.size.height)];
    //3.绘制文字
    CGRect rect = CGRectMake(12.5,12.5, 25, 25);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;
    //文字的属性
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20],NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:[UIColor whiteColor]};
    //将文字绘制上去
    [text drawInRect:rect withAttributes:dic];
    //4.获取绘制到得图片
    UIImage *watermarkImg = UIGraphicsGetImageFromCurrentImageContext();
    //5.结束图片的绘制
    UIGraphicsEndImageContext();
    
    return watermarkImg;
}

/**
 --压缩图片到指定文件大小 kb
 
 @param image 图片
 @param size 大小 kb 单位
 @return image
 */
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size{
    NSData * data = UIImageJPEGRepresentation(image, 1.0);
    CGFloat dataKBytes = data.length/1000.0;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > size && maxQuality > 0.01f) {
        maxQuality = maxQuality - 0.01f;
        data = UIImageJPEGRepresentation(image, maxQuality);
        dataKBytes = data.length / 1000.0;
        if (lastData == dataKBytes) {
            break;
        }else{
            lastData = dataKBytes;
        }
    }
    return data;
}
/**
 设置黑白图片
 
 @param image tup
 @return 图片
 */
+ (UIImage *)blackAndWhite:(UIImage *)image
{
    CIImage *beginImage = [CIImage imageWithCGImage:image.CGImage];
    
    CIImage *blackAndWhite = [CIFilter filterWithName:@"CIColorControls" keysAndValues:kCIInputImageKey, beginImage, @"inputBrightness", @0.0, @"inputContrast", @2.5, @"inputSaturation", @0.0, nil].outputImage;
    CIImage *output = [CIFilter filterWithName:@"CIExposureAdjust" keysAndValues:kCIInputImageKey, blackAndWhite, @"inputEV", @1.0, nil].outputImage;
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgiimage = [context createCGImage:output fromRect:output.extent];
    UIImage *newImage = [UIImage imageWithCGImage:cgiimage scale:image.scale orientation:image.imageOrientation];
    
    CGImageRelease(cgiimage);
    return newImage;
}
@end
