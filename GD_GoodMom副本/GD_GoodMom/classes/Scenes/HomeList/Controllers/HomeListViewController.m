//
//  HomeListViewController.m
//  GD_GoodMom
//
//  Created by lanou3g on 16/5/23.
//  Copyright © 2016年 温哲. All rights reserved.
//

#import "HomeListViewController.h"
#import <AVOSCloud/AVOSCloud.h>
@interface HomeListViewController ()

@end

@implementation HomeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:COLOR_arc green:COLOR_arc blue:COLOR_arc alpha:1.0];



}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    AVObject *todo = [AVObject objectWithClassName:@"Todo"];
    [todo setObject:@"工程师周会" forKey:@"title"];
    [todo setObject:@"每周工程师会议，周一下午2点" forKey:@"content"];
    [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // 存储成功
        } else {
            // 失败的话，请检查网络环境以及 SDK 配置是否正确
        }
    }];
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
