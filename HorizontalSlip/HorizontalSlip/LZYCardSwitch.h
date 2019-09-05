//
//  LZYCardSwitch.h
//  MVVMDemo
//
//  Created by yfmac001 on 2019/9/5.
//  Copyright © 2019 yfmac001. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZYCardModel.h"

@protocol LZYCardSwitchDelegate <NSObject>

@optional

/** 点击卡片代理方法 */
-(void)cardSwitchDidClickAtIndex:(NSInteger)index;

/** 滚动卡片代理方法 */
-(void)cardSwitchDidScrollToIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_BEGIN

@interface LZYCardSwitch : UIView
/** 当前选中位置 */
@property (nonatomic, assign, readwrite) NSInteger selectedIndex;
/** 设置数据源 */
@property (nonatomic, strong) NSArray <LZYCardModel *>*models;
/** 代理 */
@property (nonatomic, weak) id<LZYCardSwitchDelegate>delegate;
/** 是否分页，默认为NO */
@property (nonatomic, assign) BOOL pagingEnabled;
/** 手动滚动到某个卡片位置 */
- (void)switchToIndex:(NSInteger)index animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
