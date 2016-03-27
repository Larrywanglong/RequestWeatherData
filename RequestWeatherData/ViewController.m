//
//  ViewController.m
//  RequestWeatherData
//
//  Created by 王龙 on 16/3/27.
//  Copyright © 2016年 Larry（Lawrence）. All rights reserved.
//

#import "ViewController.h"
#import "HTTPManager.h"

@interface ViewController ()
{
    //    城市的输入框
    UITextField *cityNameInputTextField;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor greenColor];
    
   /*
    
    注意查看控制台的输出  在这我只是把数据请求下来了并没有展示在出来
    
    
    */
    
    cityNameInputTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 20, 200, 45)];
    cityNameInputTextField.borderStyle = UITextBorderStyleRoundedRect;
    cityNameInputTextField.placeholder  = @"请输入城市的拼音";
    cityNameInputTextField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:cityNameInputTextField];
    
    //    确认按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(220+20, 20, 80, 45);
    [btn setTitle:@"确认" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:1.000 green:0.344 blue:0.115 alpha:1.000];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(searchInfo:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)searchInfo:(UIButton *)sender{
    [cityNameInputTextField resignFirstResponder];
    if (cityNameInputTextField.text.length == 0) {
        cityNameInputTextField.placeholder = @"Sorry, 请先输入城市名";
        
    }else{
        [[HTTPManager defaultHttpManager]getWeatherWithCityName:cityNameInputTextField.text completionHander:^(id responseObject, NSError *error) {
            
//            输出天气参数
            NSLog(@"%@",responseObject);
        }];
    }
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
