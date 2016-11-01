//
//  MHTabbarViewController.m
//  newyingke
//
//  Created by ma c on 16/10/31.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHTabbarViewController.h"
#import "MHTabbar.h"
#import "MHBaseNavigationController.h"

@interface MHTabbarViewController ()<MHTabbarDelegate>

@property (nonatomic, strong) MHTabbar *mhTabbar;
@end

@implementation MHTabbarViewController

- (MHTabbar *)mhTabbar{
    if (!_mhTabbar) {
        
        _mhTabbar = [[MHTabbar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
    }
    return _mhTabbar;
}

- (void)tabbar:(MHTabbar *)tabbar clickButton:(MHItemType)idx{

}

- (void)viewDidLoad {
    [super viewDidLoad];

//添加控制器
    [self configViewController];
    //添加tabbar
    [self.tabBar addSubview:self.mhTabbar];
}
- (void)configViewController{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"MHMineViewController",@"MHMeViewController"]];
    for (NSInteger i = 0; i < array.count; i++) {
        
        NSString *vcName = array[i];
        UIViewController *viewController = [[NSClassFromString(vcName) alloc]init];
        MHBaseNavigationController *nav = [[MHBaseNavigationController alloc]initWithRootViewController:viewController];
        [array replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = array;
}


















@end
