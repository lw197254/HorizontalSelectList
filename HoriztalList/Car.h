//
//  CarModel.h
//  HoriztalList
//
//  Created by 刘伟 on 2018/1/31.
//  Copyright © 2018年 万圣伟业. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBBaseModel.h"
@interface Car : DBBaseModel
@property(nonatomic,strong ) NSNumber *own_id;

/**
 *  车的ID
 */
@property(nonatomic,strong) NSNumber *car_id;


@property(nonatomic,copy) NSString *brand;

@property(nonatomic,assign) NSInteger price;
@end
