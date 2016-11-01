//
//  MHTabbar.m
//  newyingke
//
//  Created by ma c on 16/10/31.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHTabbar.h"

@interface MHTabbar ()
@property (nonatomic, strong) UIImageView *tabbarView;//tabbar
@property (nonatomic, strong) NSArray *distArray;//存放controller的数组
@property (nonatomic, strong) UIButton *lastItem;//切换点击的button
@property (nonatomic, strong) UIButton *laurenBtn;//直播按钮

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

- (UIButton *)laurenBtn{
    if (!_laurenBtn) {
        _laurenBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_laurenBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_laurenBtn addTarget:self action:@selector(clickButton:) forControlEvents:(UIControlEventTouchUpInside)];
        _laurenBtn.tag = MHItemTypeLaunch;
        [_laurenBtn sizeToFit];
    }
    return _laurenBtn;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.tabbarView];
        
        for (NSInteger i = 0; i < self.distArray.count; i++) {
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            item.adjustsImageWhenHighlighted = NO;
            [item setImage:[UIImage imageNamed:self.distArray[i]] forState:(UIControlStateNormal)];
            [item setImage:[UIImage imageNamed:[self.distArray[i] stringByAppendingString:@"_p"]] forState:(UIControlStateSelected)];
            
            [item addTarget:self action:@selector(clickButton:) forControlEvents:(UIControlEventTouchUpInside)];
            
            item.tag = MHItemTypeLive + i;
            
            if (i == 0) {
                item.selected = YES;
                self.lastItem = item;
            }
            
            [self addSubview:item];
        }
        [self addSubview:self.laurenBtn];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.tabbarView.frame = self.bounds;
    CGFloat width = self.bounds.size.width / self.distArray.count;
    for (NSInteger i = 0; i < [self subviews].count; i++) {
        UIButton *btn = [self subviews][i];
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.frame = CGRectMake((btn.tag - MHItemTypeLive)*width, 0, width, self.bounds.size.height);
        }
    }
    [self.laurenBtn sizeToFit];
    self.laurenBtn.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height - 50);
    
}

- (void)clickButton:(UIButton *)button{
    
    if ([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]){
        
        [self.delegate tabbar:self clickButton:button.tag];
    }
    if (self.block) {
        
        self.block(self,button.tag);
    }
    
    if (button.tag == MHItemTypeLaunch) {
        return;
    }
    self.lastItem.selected = NO;
    button.selected = YES;
    self.lastItem = button;
    
    [UIView animateWithDuration:0.2 animations:^{
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            button.transform = CGAffineTransformIdentity;
        }];
    }];
    
 
    
}

@end
