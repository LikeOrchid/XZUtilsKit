//
//  BaseTextView.h
//  XZUtilsKitDemo
//
//  Created by yanyu on 2019/4/19.
//  Copyright © 2019 yanyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlaceholderTextView : UITextView

@property (nonatomic, strong) NSString *placeholder;

@property (nonatomic, strong) UIFont *placeholderFont;

@property (nonatomic, strong) UIColor *placeholderColor;

@end

NS_ASSUME_NONNULL_END
