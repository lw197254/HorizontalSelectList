//
//  DBHelper.m
//  HoriztalList
//
//  Created by 刘伟 on 2018/2/1.
//  Copyright © 2018年 万圣伟业. All rights reserved.
//

#import "DBHelper.h"

@interface DBHelper ()

@property (nonatomic, retain) FMDatabaseQueue *dbQueue;

@end

@implementation DBHelper

+(DBHelper *)sharedHelper{
    static DBHelper *instance = nil;
    static dispatch_once_t onceToken;
    if (!instance) {
        dispatch_once(&onceToken, ^{
            instance = [[super allocWithZone:nil]init];
        });
    }
    return instance;
}
//lazy load
-(FMDatabaseQueue *)dbQueue{
    if (!_dbQueue) {
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:[[self class] dbPath]];
    }
    return _dbQueue;
}
//数据库地址
+ (NSString *)dbPath
{
    NSString *docsdir = [NSSearchPathForDirectoriesInDomains( NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager *filemanage = [NSFileManager defaultManager];
    docsdir = [docsdir stringByAppendingPathComponent:@"AppDataBase"];
    BOOL isDir;
    BOOL exit =[filemanage fileExistsAtPath:docsdir isDirectory:&isDir];
    if (!exit || !isDir) {
        [filemanage createDirectoryAtPath:docsdir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *dbpath = [docsdir stringByAppendingPathComponent:@"TierTime.sqlite"];
    return dbpath;
}

#pragma --mark 保证单例不会被创建成新对象
+(instancetype)alloc{
    NSAssert(0, @"这是一个单例对象，请使用+(DBHelper *)sharedHelper方法");
    return nil;
}
+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [DBHelper sharedHelper];
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return [DBHelper sharedHelper];
}  
@end
