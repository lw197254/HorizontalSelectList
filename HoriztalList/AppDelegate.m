//
//  AppDelegate.m
//  HoriztalList
//
//  Created by 刘伟 on 2017/8/3.
//  Copyright © 2017年 万圣伟业. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"
#import <YYModel.h>
#import "DataBase.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    NSDictionary*dict = @{@"carArray":@[@{@"own_id":@"1",@"name":@"xiaoming",@"brand":@"dazhong"},@{@"own_id":@"2",@"name":@"xiaoming",@"brand":@"da"}],@"ID":@"3",@"age":@"3",@"number":@"3"};
    Person*model = [Person yy_modelWithJSON:dict];
    [model saveOrUpdate];
  NSArray*array =   [Person findAll];
   
////    NSArray*array = @[@{@"age":@"1",@"name":@"xiaoming"},@{@"age":@"1",@"name":@"xiaoming"}];
////    NSArray*array1 = [NSArray yy_modelArrayWithClass:[CarModel class] json:array];
////    CarModel*car = [model.array firstObject];
//    Car*car = [Car yy_modelWithJSON:@{@"age":@"1",@"name":@"xiaoming",@"brand ":@"da"}];
//    
//    [car commit];
//    [model commit];
//   
//    SRKResultSet*q = [[Car query]  fetch ];
//  Car*model1 =  [q firstObject];
//    for (Car*model in q) {
//        NSLog(@"__________%@", model.brand);
//    }
//   
//    Person*person = [[Person alloc]init];
//    person.age = 15;
//    [[DataBase sharedDataBase]addPerson: person];
//    
//     NSArray*aaaa = [[DataBase sharedDataBase] getAllPerson];
   
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
