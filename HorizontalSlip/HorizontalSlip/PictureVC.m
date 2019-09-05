//
//  PictureVC.m
//  MVVMDemo
//
//  Created by yfmac001 on 2019/9/5.
//  Copyright © 2019 yfmac001. All rights reserved.
//

#import "PictureVC.h"
#import "LZYCardSwitch.h"

@interface PictureVC ()<LZYCardSwitchDelegate>

@property (nonatomic, strong) LZYCardSwitch *cardSwitch;
/** 数据源 */
@property (nonatomic, strong) NSMutableArray<LZYCardModel *> *models;

@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation PictureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addImageView];
    
    [self addCardSwitch];
    
    // 获取数据
    [self getData];
}



- (void)addImageView {
    self.imageView = [[UIImageView alloc] init];
//    self.imageView.backgroundColor = [UIColor redColor];
//    self.imageView.image = [UIImage imageNamed:@"1.png"];
    self.imageView.frame = self.view.bounds;
    [self.view addSubview:self.imageView];
    
    //毛玻璃效果
    UIBlurEffect* effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView* effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = self.view.bounds;
    [self.imageView addSubview:effectView];
}

- (void)addCardSwitch {
    //初始化
    self.cardSwitch = [[LZYCardSwitch alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 500)];
    //self.cardSwitch = [[LZYCardSwitch alloc] initWithFrame:self.view.bounds];
    //设置代理方法
    self.cardSwitch.delegate = self;
    //分页切换
    self.cardSwitch.pagingEnabled = YES;
    [self.view addSubview:self.cardSwitch];
}

#pragma mark - 获取数据
- (void)getData {
   NSString *path = [[NSBundle mainBundle] pathForResource:@"DataPropertyList" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    self.models = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        LZYCardModel *model = [[LZYCardModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [self.models addObject:model];
    }
    
    //设置卡片数据源
    self.cardSwitch.models = self.models;
    
    //更新背景图
    [self configImageViewOfIndex:self.cardSwitch.selectedIndex];
}

#pragma mark -
#pragma mark 更新imageView
- (void)configImageViewOfIndex:(NSInteger)index {
    //更新背景图
    LZYCardModel *model = self.models[index];
    self.imageView.image = [UIImage imageNamed:model.imageName];
}

#pragma mark -
#pragma mark LZYCardSwitchDelegate
- (void)cardSwitchDidClickAtIndex:(NSInteger)index {
    NSLog(@"点击了：%zd",index);
    [self configImageViewOfIndex:index];
}

- (void)cardSwitchDidScrollToIndex:(NSInteger)index {
    NSLog(@"滚动到了击了：%zd",index);
    [self configImageViewOfIndex:index];
}

@end
