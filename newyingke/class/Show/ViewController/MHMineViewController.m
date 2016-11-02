//
//  MHMineViewController.m
//  newyingke
//
//  Created by ma c on 16/11/1.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHMineViewController.h"

@interface MHMineViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (nonatomic, strong) NSArray *titleArray;
@end

@implementation MHMineViewController

- (NSArray *)titleArray{

    if (!_titleArray) {
        _titleArray = @[@"关注",@"热门",@"附近"];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI{

    [self stupNav];
    [self stepAddChildViewController];
}
- (void)stepAddChildViewController{
    
    NSArray *vcNames = @[@"MHFouseViewController",@"MHHotViewController",@"MHNearViewController"];
    
    for (NSInteger i = 0; i < vcNames.count; i++) {
        NSString *vcName = vcNames[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc]init];
        vc.title = self.titleArray[i];
        [self addChildViewController:vc];
    }
    
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.titleArray.count, 0);
    //设置默认跳到第二个界面
    self.contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    //手动添加一次
    [self scrollViewDidEndDecelerating:self.contentScrollView];
}

- (void)stupNav{

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    CGFloat width = SCREEN_WIDTH;
    CGFloat height = SCREEN_HEIFHT;
    
    NSInteger idx = scrollView.contentOffset.x / width;
    
    UIViewController *vc = self.childViewControllers[idx];
    
    if ([vc isViewLoaded]) return;
    
    vc.view.frame = CGRectMake(scrollView.contentOffset.x, 0, scrollView.frame.size.width, height);
    
    [scrollView addSubview:vc.view];

}
























@end
