//
//  UIViewController+StartActivityForResult.m
//  StartActivityForResult
//
//  Created by 刘晓恒 on 2018/5/22.
//  Copyright © 2018年 刘晓恒. All rights reserved.
//

#import "UIViewController+XHStartActivityForResult.h"
#import <objc/runtime.h>


@implementation UIViewController (XHStartActivityForResult)

- (void)xh_pushViewController:(UIViewController *)vc animated:(BOOL)animated extra:(Intent *)extra {
    [self xh_pushViewController:vc animated:animated extra:extra requestCode:0];
}

- (void)xh_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)animated extra:(Intent *)extra completion:(void (^)(void))completion {
    [self xh_presentViewController:viewControllerToPresent animated:animated extra:extra requestCode:0 completion:completion];
}

- (void)xh_pushViewController:(UIViewController *)vc animated:(BOOL)animated extra:(Intent *)extra requestCode:(NSInteger)requestCode {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return ;
    }
    
    UINavigationController *nav;
    if ([self isKindOfClass:[UINavigationController class]]) {
        nav = (UINavigationController *)self;
    } else {
        nav = self.navigationController;
    }
    
    UIViewController *top = [nav.viewControllers lastObject];
    vc.requestCode = requestCode;
    vc.activityResultDelegate = top;
    vc.extra = extra;
    [nav pushViewController:vc animated:animated];
}

- (void)xh_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)animated extra:(Intent *)extra requestCode:(NSInteger)requestCode completion:(void (^)(void))completion {
    viewControllerToPresent.requestCode = requestCode;
    viewControllerToPresent.activityResultDelegate = self;
    viewControllerToPresent.extra = extra;
    [self presentViewController:viewControllerToPresent animated:animated completion:completion];
}

#pragma mark - 设置回调结果
- (void)xh_setResult:(Intent *)extra {
    [self xh_setResult:self.requestCode intent:extra];
}

- (void)xh_setResult:(NSInteger)resultCode intent:(Intent *)extra {
    if ([self.activityResultDelegate respondsToSelector:@selector(activityResult:resultCode:intent:)]) {
        [self.activityResultDelegate activityResult:resultCode resultCode:resultCode intent:extra];
    }
}

#pragma mark - Setter & Getter
const char * requestCodeKey;
- (void)setRequestCode:(NSInteger)requestCode {
    objc_setAssociatedObject(self, &requestCodeKey, @(requestCode), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)requestCode {
    id value = objc_getAssociatedObject(self, &requestCodeKey);
    return [value integerValue];
}

const char * extraKey;
- (void)setExtra:(Intent *)extra {
    objc_setAssociatedObject(self, &extraKey, extra, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (Intent *)extra {
    return objc_getAssociatedObject(self, &extraKey);
}

#pragma mark - Private Method
const char *activityResultDelegateKey;
- (void)setActivityResultDelegate:(id<ActivityResult>)activityResultDelegate {
    objc_setAssociatedObject(self, &activityResultDelegateKey, activityResultDelegate, OBJC_ASSOCIATION_ASSIGN);
}

- (id<ActivityResult>)activityResultDelegate {
    return objc_getAssociatedObject(self, &activityResultDelegateKey);
}

@end






