//
//  KJMarqueeLabel.h
//  OwenInfant
//
//  Created by yanyu on 2019/6/6.
//  Copyright © 2019 yons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KJMarqueeLabelType) {
    KJMarqueeLabelTypeLeft = 0,//向左边滚动
    KJMarqueeLabelTypeLeftRight = 1,//先向左边，再向右边滚动
};

NS_ASSUME_NONNULL_BEGIN

@interface MarqueeLabel : UILabel
@property(nonatomic,unsafe_unretained)KJMarqueeLabelType marqueeLabelType;
@property(nonatomic,unsafe_unretained)CGFloat speed;//速度
@property(nonatomic,unsafe_unretained)CGFloat secondLabelInterval;
@property(nonatomic,unsafe_unretained)NSTimeInterval stopTime;//滚到顶的停止时间
@end

NS_ASSUME_NONNULL_END
