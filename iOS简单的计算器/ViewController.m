//
//  ViewController.m
//  iOS简单的计算器
//
//  Created by 何兵兵 on 2021/9/28.
//

#import "ViewController.h"
#import "CalculatorView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    CalculatorView * calView = [[CalculatorView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:calView];
    NSLog(@"test1");
}


@end
