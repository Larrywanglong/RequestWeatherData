//
//  HTTPManager.m
//  RequestWeatherData
//
//  Created by 王龙 on 16/3/27.
//  Copyright © 2016年 Larry（Lawrence）. All rights reserved.
//

#import "HTTPManager.h"

//导入AFNetworking框架  使用cocoaPods导入比较方便  也可以下载Demo拖入AFNetWorking文件夹
#import "AFNetworking.h"

@implementation HTTPManager
/**
 *  实现单例方法
 *
 *  @return 返回对象
 */
+ (instancetype)defaultHttpManager{
    static HTTPManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HTTPManager alloc]init];
    });
    return manager;
}

/**
 *  网络请求的方法
 *
 *  @param urlString        请求的接口地址
 *  @param header           请求头 @{@"请求头的类型":@"请求头的内容"}
 *  @param completionHander 回调参数 请求返回的数据 以及错误信息
 */
- (void)getMessageWithURLString:(NSString *)urlString header:(NSDictionary *)header completionHander:(CompletionHandler)completionHander{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request addValue:header.allValues[0] forHTTPHeaderField:header.allKeys[0]];
//    2、创建session
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
//    3、创建任务
    NSURLSessionDataTask *task = [sessionManager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        回调
        completionHander(responseObject,error);
        
    }];
    
//    4、开启任务
    [task resume];
    
}
/**
 *  请求天气情况的方法
 *
 *  @param cityName         城市名字的拼音
 *  @param completionHander block回调
 */
- (void)getWeatherWithCityName:(NSString *)cityName completionHander:(CompletionHandler)completionHander{
    
//    调用网络请求方法 注意宏定义 和 请求头 是提前在.h文件中声明过的
    [self getMessageWithURLString:[NSString stringWithFormat:@"%@%@?city=%@",HOST_NAME,GET_WEATHER,cityName] header:@{@"apikey":@"800df6eb77392d2205b55cfccbcc1662"} completionHander:^(id responseObject, NSError *error) {
        
        completionHander(responseObject,error);
        
        
    }];
}



@end
