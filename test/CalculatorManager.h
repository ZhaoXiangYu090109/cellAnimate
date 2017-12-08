//
//  CalculatorManager.h
//  test
//
//  Created by mac on 17/07/05.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorManager : NSObject
/** 结果值*/
@property(assign, nonatomic) int result;

-(void)add:(int)value;
-(CalculatorManager *(^)(int))add;
@end
