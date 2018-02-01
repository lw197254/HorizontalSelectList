//
//  DBHelper.h
//  HoriztalList
//
//  Created by 刘伟 on 2018/2/1.
//  Copyright © 2018年 万圣伟业. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <FMDB.h>


/**
 *  数据库管理工具
 */
@interface DBHelper : NSObject

@property(nonatomic,retain,readonly)FMDatabaseQueue *dbQueue;

/**
 *  获取数据库管理类单例
 */
+(DBHelper *)sharedHelper;

/**
 *  数据库文件沙盒地址
 */
+ (NSString *)dbPath;

@end
