//
//  PersonModel.m
//  HoriztalList
//
//  Created by 刘伟 on 2018/1/31.
//  Copyright © 2018年 万圣伟业. All rights reserved.
//

#import "Person.h"

@implementation Person

+(NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"carArray" : [Car class]
              };
}
//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{@"year" : @"age"};
//}


@end
