//
//  AppDelegate.m
//  GD_GoodMom
//
//  Created by lanou3g on 16/5/23.
//  Copyright © 2016年 温哲. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor yellowColor];
    [self.window makeKeyAndVisible];
    UINavigationController *navC = [[UINavigationController alloc]initWithRootViewController:[RootViewController new]];
    self.window.rootViewController = navC;
    
    
    [AVOSCloud setApplicationId:@"cT0xSMnf6cxIn8TjvokyfdOd-gzGzoHsz"
                      clientKey:@"7Wwr8918aCROc6MMRgyyzkQV"];
    
    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
    
    
    AVUser *user = [AVUser user];// 新建 AVUser 对象实例
    user.username = @"susan";// 设置用户名
    user.password =  @"123";// 设置密码
    user.email = @"susan_w_z@163.com";// 设置邮箱
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // 注册成功
        } else {
            // 失败的原因可能有多种，常见的是用户名已经存在。
        }
    }];
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
