//
//  UITableView+EstimateHeight.h
//  FlyDog
//
//  Created by Toommi on 2017/11/6.
//  Copyright © 2017年 Toommi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (EstimateHeight)
-(void)updateEsTimateHight;
-(void)setNormalListView:(NSInteger )num  withString:(NSString *)str;
-(void)reloadDataAnimations;
@end
