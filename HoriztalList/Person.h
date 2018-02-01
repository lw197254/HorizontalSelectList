//
//  PersonModel.h
//  HoriztalList
//
//  Created by 刘伟 on 2018/1/31.
//  Copyright © 2018年 万圣伟业. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBBaseModel.h"
#import "Car.h"
@interface Person : DBBaseModel
@property(nonatomic,strong) NSNumber *ID;


@property(nonatomic,copy) NSString *name;

@property(nonatomic,assign) NSInteger age;

@property(nonatomic,assign) NSInteger number;
/**
 *  一个人可以拥有多辆车
 */
@property(nonatomic,strong) NSMutableArray<Car*> *carArray;




@end
