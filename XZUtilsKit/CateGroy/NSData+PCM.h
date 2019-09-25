//
//  NSData+PCM.h
//  OwenInfant
//
//  Created by yanyu on 2019/6/6.
//  Copyright © 2019 yons. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (PCM)
// 为pcm文件写入wav头
+(NSData*) writeWavHead:(NSData *)audioData;
@end

NS_ASSUME_NONNULL_END
