//
//  MHTabbar.m
//  newyingke
//
//  Created by ma c on 16/10/31.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHTabbar.h"

@interface MHTabbar ()
@property (nonatomic, strong) UIImageView *tabbarView;
@property (nonatomic, strong) NSArray *distArray;

@end

@implementation MHTabbar

- (UIImageView *)tabbarView{

    if (!_tabbarView) {
        _tabbarView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbarView;
}
- (NSArray *)distArray{
    if (!_distArray) {
        _distArray = @[@"tab_live",@"tab_me"];
    }
    return _distArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.tabbarView];
        for (NSInteger i = 0; i < self.distArray.count; i++) {
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            [item setImage:[UIImage imageNamed:self.distArray[i]] forState:(UIControlStateNormal)];
            [item setImage:[UIImage imageNamed:[self.distArray[i] stringByAppendingString:@"_p"]] forState:(UIControlStateSelected)];
            
            [item addTarget:self action:@selector(clickButton:) forControlEvents:(UIControlEventTouchUpInside)];
            
            item.tag = MHItemTypeLive + i;
            [self addSubview:item];
        }
    }
    return self;
}

- (void)clickButton:(UIButton *)button{
    
    if ([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]){
        
        [self.delegate tabbar:self clickButton:button.tag];
    }
    if (self.block) {
        
        self.block(self,button.tag);
    }
}

@end
