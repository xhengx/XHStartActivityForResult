//
//  XHViewController.m
//  XHStartActivityForResult
//
//  Created by xheng on 05/23/2018.
//  Copyright (c) 2018 xheng. All rights reserved.
//

#import "XHViewController.h"
#import "XHNextViewController.h"
#import <XHStartActivityForResult/XHStartActivityForResult.h>

@interface XHViewController ()

@end

@implementation XHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)action1:(id)sender {
    XHNextViewController *vc = [[XHNextViewController alloc] init];
    
    Intent *intent = [[Intent alloc] init];
    [intent putExtra:@"test" value:@"001"];
    [intent putExtra:@"hellp" value:@"002"];
    [self.navigationController xh_pushViewController:vc animated:YES extra:intent requestCode:1000];
}
- (IBAction)action2:(id)sender {
    XHNextViewController *vc = [[XHNextViewController alloc] init];
    [self.navigationController xh_pushViewController:vc animated:YES extra:nil requestCode:2000];
}


- (IBAction)action3:(id)sender {
    XHNextViewController *vc = [[XHNextViewController alloc] init];
    [self xh_presentViewController:vc animated:YES extra:nil requestCode:3000 completion:nil];
}

- (void)activityResult:(NSInteger)requestCode resultCode:(NSInteger)resultCode intent:(Intent *)intent {
    
    NSString *title = NSStringFromSelector(_cmd);
    NSString *content = [NSString stringWithFormat:@"requestCode:%ld\nresultCode:%ld\nintent:%@",  requestCode, resultCode, intent];
    
    [self alertWithTitle:title content:content];
    
}


- (void)alertWithTitle:(NSString *)title content:(NSString *)content {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:content preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:confirmAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
