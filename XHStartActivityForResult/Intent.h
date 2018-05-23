//
//  Intent.h
//  StartActivityForResult
//
//  Created by 刘晓恒 on 2018/5/22.
//  Copyright © 2018年 刘晓恒. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 参数对象
 */
@interface Intent : NSObject


/**
 获取参数内容

 @param key 具体参数KEY
 @return 参数对象
 */
- (nullable id)getExtra:(NSString *)key; //获取参数

/**
 设置参数内容

 @param key 具体参数KEY
 @param val 具体参数对象
 */
- (void)putExtra:(NSString *)key value:(id)val; //设置参数


@end
NS_ASSUME_NONNULL_END
