//
//  UIViewController+StartActivityForResult.h
//  StartActivityForResult
//
//  Created by 刘晓恒 on 2018/5/22.
//  Copyright © 2018年 刘晓恒. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Intent;

@protocol ActivityResult <NSObject>

@optional
- (void)activityResult:(NSInteger)requestCode resultCode:(NSInteger)resultCode intent:(Intent *)intent;

@end

@interface UIViewController (XHStartActivityForResult) <ActivityResult>


@property (nonatomic, assign) NSInteger requestCode; //请求编码
@property (nonatomic, strong) Intent *extra; //请求参数,key-value结构


/**
 控制器切换

 @param vc 目标控制器
 @param animated 动画
 @param extra 请求参数
 
 @discussion requestCode 默认为0
 */
- (void)xh_pushViewController:(UIViewController *)vc
                  animated:(BOOL)animated
                     extra:(Intent *)extra;



/**
 控制器切换

 @param viewControllerToPresent 目标控制器
 @param animated 动画
 @param extra 请求编码,区分请求对象
 @param completion 切换结束回调
 
 @discussion requestCode 默认为0
 */
- (void)xh_presentViewController:(UIViewController *)viewControllerToPresent
                     animated:(BOOL)animated
                        extra:(Intent *)extra
                   completion:(void (^)(void))completion;


/**
 控制器切换

 @param vc 目标控制器
 @param animated 动画
 @param extra 传递参数
 @param requestCode 请求编码,区分请求对象
 */
- (void)xh_pushViewController:(UIViewController *)vc
                  animated:(BOOL)animated
                     extra:(Intent *)extra
               requestCode:(NSInteger)requestCode;

/**
 控制器切换

 @param viewControllerToPresent 目标控制器
 @param animated 动画
 @param extra 传递参数
 @param requestCode 请求编码,区分请求对象
 @param completion 切换结束回调
 */
- (void)xh_presentViewController:(UIViewController *)viewControllerToPresent
                     animated:(BOOL)animated
                        extra:(Intent *)extra //传递参数
                  requestCode:(NSInteger)requestCode //请求编码，区分请求对象
                   completion:(void (^)(void))completion;



/**
 设置返回值
 将extra数据返回到上级控制器
 
 @param extra 返回数据
 @discussion resultCode 默认为0
 */
- (void)xh_setResult:(Intent *)extra; //设置返回值

/**
 设置返回值
 将extra数据返回到上级控制器
 
 @param resultCode 返回结果编码
 @param extra 返回数据

 */
- (void)xh_setResult:(NSInteger)resultCode intent:(Intent *)extra; //设置返回值

@end

