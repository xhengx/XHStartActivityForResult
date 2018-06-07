//
//  XHNextViewController.m
//  XHStartActivityForResult_Example
//
//  Created by 刘晓恒 on 2018/5/23.
//  Copyright © 2018年 xheng. All rights reserved.
//

#import "XHNextViewController.h"
#import <XHStartActivityForResult/XHStartActivityForResult.h>

@interface XHNextViewController ()

@end

@implementation XHNextViewController

- (void)viewDidLoad { 
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"%@", self.extra);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSInteger requestCode = self.requestCode;
    Intent *intent = [Intent new];
    switch (requestCode) {
        case 1000:
            [intent putExtra:@"1000+ret" value:@"1000+ret"];
            break;
        case 2000:
            [intent putExtra:@"2000+ret" value:@"2000+ret"];
            break;
        case 3000:
            [intent putExtra:@"3000+ret" value:@"3000+ret"];
            break;
        default:
            break;
    }
    [intent putExtra:@"completed" value:@"completed"];
    [self xh_setResult:self.requestCode intent:intent];
}

@end
