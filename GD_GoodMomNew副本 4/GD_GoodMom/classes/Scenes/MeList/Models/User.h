//
//  User.h
//  GD_GoodMom
//
//  Created by lanou3g on 16/5/25.
//  Copyright © 2016年 温哲. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property(nonatomic,strong)NSString *userName;//用户名
@property(nonatomic,strong)NSString *password;//密码
@property(nonatomic,strong)NSString *avatar;//头像

@property(nonatomic,assign)BOOL loginState;//是否登录

@end
