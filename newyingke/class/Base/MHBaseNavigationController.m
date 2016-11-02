//
//  MHBaseNavigationController.m
//  newyingke
//
//  Created by ma c on 16/11/1.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHBaseNavigationController.h"

@interface MHBaseNavigationController ()


@end

@implementation MHBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *backImage = [UIImage imageNamed:@"global_tittle_bg"];
    [self.navigationBar setBackgroundImage:backImage forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.tintColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
