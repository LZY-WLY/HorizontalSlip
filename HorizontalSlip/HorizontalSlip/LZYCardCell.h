//
//  Card.h
//  CardSwitchDemo
//
//  Created by Apple on 2016/11/9.
//  Copyright © 2016年 Apple. All rights reserved.
//  被切换的卡片

#import <UIKit/UIKit.h>
#import "LZYCardModel.h"

@interface LZYCardCell : UICollectionViewCell

@property (nonatomic, strong) LZYCardModel *model;

@end
