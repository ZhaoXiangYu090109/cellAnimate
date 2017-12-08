//
//  CalculatorManager.m
//  test
//
//  Created by mac on 17/07/05.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CalculatorManager.h"

@implementation CalculatorManager
-(void)add:(int)value
{
    _result += value;
}
-(CalculatorManager *(^)(int))add
{
    //方法本身返回一个blockd代码块
    return ^CalculatorManager *(int value){
        _result += value;
        //block块内部再返回一个instance实例
        return self;
    };
}
@end
