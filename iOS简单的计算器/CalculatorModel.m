//
//  CalculatorViewModel.m
//  iOS简单的计算器
//
//  Created by 何兵兵 on 2021/9/29.
//

#import "CalculatorModel.h"

@implementation CalculatorModel

- (instancetype)init
{
    self = [super init];
    if (self) {
       self.caculatorArray = @[@[@"1",@"2",@"3"],@[@"4",@"5",@"6"],@[@"7",@"8",@"9"],@[@"0",@"+",@"-"],@[@"*",@"/",@"="]];
    }
    return self;
}
@end
