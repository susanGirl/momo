//
//  LoginViewController.h
//  GD_GoodMom
//
//  Created by lanou3g on 16/5/24.
//  Copyright © 2016年 温哲. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVOSCloud/AVOSCloud.h>
#import "User.h"

typedef void(^completionBlock)(User *user);


@interface LoginViewController : UIViewController

//登录成功后回调此方法
@property(nonatomic,strong)completionBlock completion;

@end
