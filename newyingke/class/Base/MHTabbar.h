//
//  MHTabbar.h
//  newyingke
//
//  Created by ma c on 16/10/31.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger ,MHItemType){
    MHItemTypeLaunch = 10,//直播
    MHItemTypeLive = 100,//主要
    MHItemTypeMe ,//我的


};

@class MHTabbar;
typedef void(^TabBlock)(MHTabbar *tabbar, MHItemType idx);

@protocol MHTabbarDelegate <NSObject>

- (void)tabbar:(MHTabbar *)tabbar clickButton:(MHItemType)idx;

@end


@interface MHTabbar : UIView

@property (nonatomic, weak)id<MHTabbarDelegate>delegate;
@property (nonatomic, copy)TabBlock block;

@end
