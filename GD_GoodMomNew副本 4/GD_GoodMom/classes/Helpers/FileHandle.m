//
//  FileHandle.m
//  DouBanProject
//
//  Created by lanou3g on 16/5/13.
//  Copyright © 2016年 庄辉. All rights reserved.
//

#import "FileHandle.h"
#import "User.h"
@implementation FileHandle
//存储对象类型
#define KuserDefaults(object,key) [[NSUserDefaults standardUserDefaults]setObject:object forKey:key];
//存储BOOL类型
#define kBoolUserDegaults(value,key) [[NSUserDefaults standardUserDefaults]setBool:value forKey:key]

//获取对象类型的值
#define kGetObjectUserDefaults(key) [[NSUserDefaults standardUserDefaults]objectForKey:key]


//获取BOOL类型
#define kGetBoolUserDefaults(key) [[NSUserDefaults standardUserDefaults]boolForKey:key]




static FileHandle *fileDataHandle = nil;
+ (instancetype)shareInstance
{
    if (fileDataHandle == nil) {
        fileDataHandle = [[[self class] alloc] init];
    }
    return fileDataHandle;
}




/**
 *  存储用户信息
 *
 *  @param user 用户对象
 */
+(void)saveUserInfo:(User *)user{
    
  KuserDefaults(user.userName, @"userName");
  KuserDefaults(user.password , @"password");
  KuserDefaults(user.avatar, @"avatar");
  kBoolUserDegaults(user.loginState, @"loginState");
  

   
}
/**
 *  获取用户信息
 *
 *  @return 用户对象
 */

+(User *)getUserInfo{
    
 User *user = [[User alloc]init];
 user.userName   =   kGetObjectUserDefaults(@"userName");
 user.password   =   kGetObjectUserDefaults(@"password");
 user.loginState =   kGetBoolUserDefaults(@"loginState");
 user.avatar =       kGetObjectUserDefaults(@"avatar");
 return user;
    
}
/**
 *  删除用户信息
 */

+(void)removeUserInfo{

    KuserDefaults(nil, @"userName");
    KuserDefaults(nil, @"password");
    KuserDefaults(nil, @"avatar");
    kBoolUserDegaults(NO, @"loginState");

}

#pragma mark 数据库缓存
#pragma mark  缓存文件夹
-(NSString *)cachesPath{

    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];

}
#pragma mark 数据库路径
-(NSString *)databaseFielePath:(NSString *)databaseName{

    return [[self cachesPath]stringByAppendingPathComponent:databaseName];

}


@end
