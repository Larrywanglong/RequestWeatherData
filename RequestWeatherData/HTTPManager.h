//
//  HTTPManager.h
//  RequestWeatherData
//
//  Created by 王龙 on 16/3/27.
//  Copyright © 2016年 Larry（Lawrence）. All rights reserved.
//

#import <Foundation/Foundation.h>

//服务器名字
#define HOST_NAME @"http://apis.baidu.com/"

//接口的名字
//获得天气情况
#define GET_WEATHER @"heweather/weather/free"

/**
 *  Block回调参数
 *
 *  @param responseObject 回调的请求下来的数据
 *  @param error          错误信息
 */
typedef void(^CompletionHandler)(id responseObject, NSError *error);





@interface HTTPManager : NSObject
//单例方法  用来初始化对象
+ (instancetype)defaultHttpManager;


/**
 *  get方式发送网络请求 可以带请求头
 *
 *  @param urlString        请求的接口地址
 *  @param header           请求头 @{@"请求头的类型":@"请求头的内容"}
 *  @param completionHander 回调参数 请求返回的数据 以及错误信息
 */
- (void)getMessageWithURLString:(NSString *)urlString header:(NSDictionary *)header completionHander:(CompletionHandler)completionHander;


/**
 *  获得天气情况的方法
 *
 *  @param cityName 城市名字拼音
 */
- (void)getWeatherWithCityName:(NSString *)cityName completionHander:(CompletionHandler)completionHander;



@end
