//
//  FileHandle.h
//  DouBanProject
//
//  Created by lanou3g on 16/5/13.
//  Copyright © 2016年 庄辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileHandle : NSObject

#pragma mark - 方法
+ (instancetype)shareInstance;

/**
 *  存储用户信息
 *
 *  @param user 用户对象
 */
+(void)saveUserInfo:(User *)user;

/**
 *  获取用户信息
 *
 *  @return 用户对象
 */


+(User *)getUserInfo;


/**
 *  删除用户信息
 */

+(void)removeUserInfo;


#pragma mark 数据库
#pragma mark 缓存文件夹
-(NSString *)cachesPath;
#pragma mark 数据库路径
-(NSString *)databaseFielePath:(NSString *)databaseName;



@end
