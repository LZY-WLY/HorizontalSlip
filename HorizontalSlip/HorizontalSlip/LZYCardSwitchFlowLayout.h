//
//  LZYCardSwitchFlowLayout.h
//  MVVMDemo
//
//  Created by yfmac001 on 2019/9/5.
//  Copyright © 2019 yfmac001. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^LZYCenterIndexPathBlock)(NSIndexPath *indexPath);

@interface LZYCardSwitchFlowLayout : UICollectionViewFlowLayout

@property (nonatomic , copy) LZYCenterIndexPathBlock centerBlock;

@end

NS_ASSUME_NONNULL_END
