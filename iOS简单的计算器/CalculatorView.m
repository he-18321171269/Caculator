//
//  CalculatorView.m
//  iOS简单的计算器
//
//  Created by 何兵兵 on 2021/9/29.
//

#import "CalculatorView.h"
#import "CalculatorModel.h"
@interface CalculatorView()
@property(strong,nonatomic)UILabel * label;
@property(assign,nonatomic)long long firstResult;
@property(copy,nonatomic)NSString * mark;
@property(strong,nonatomic) CalculatorModel * calViewModel;
@property(assign,nonatomic)BOOL isClickSymbol;
@end
@implementation CalculatorView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _isClickSymbol = NO;
        self.calViewModel = [[CalculatorModel alloc]init];
        
        [self setCalculatorView];
    }
    return self;
}

-(void)setCalculatorView{
     _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, self.bounds.size.width, 50)];
    _label.textAlignment = NSTextAlignmentRight;
    _label.font = [UIFont systemFontOfSize:32];
    _label.backgroundColor = [UIColor cyanColor];
    [self addSubview:_label];
    
    
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 3; j++) {
            UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(j * (self.bounds.size.width/3.5)+32, 100+i * 52, self.bounds.size.width/4, 50)];
            [btn setTitle:self.calViewModel.caculatorArray[i][j] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor cyanColor]];
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self addSubview:btn];
        }
    }
}


-(void)btnClicked:(UIButton*)btn{
    
    long long result = 0;
    if ([btn.titleLabel.text isEqualToString:@"+"] || [btn.titleLabel.text isEqualToString:@"-"] || [btn.titleLabel.text isEqualToString:@"*"] || [btn.titleLabel.text isEqualToString:@"/"]) {
        self.firstResult = _label.text.longLongValue;
        
        self.mark = btn.titleLabel.text;
        _isClickSymbol = YES;
    } else if ([btn.titleLabel.text isEqualToString:@"="]){
        if ([self.mark isEqualToString:@"+"]) {
            result = self.firstResult + _label.text.longLongValue;
        }else if([self.mark isEqualToString:@"-"]) {
            result = self.firstResult - _label.text.longLongValue;
        }else if([self.mark isEqualToString:@"*"]) {
            result= self.firstResult * _label.text.longLongValue;
        }else if([self.mark isEqualToString:@"/"]) {
            result = self.firstResult / _label.text.longLongValue;
        }
        _label.text = [NSString stringWithFormat:@"%lld",result];
    } else {
    
        if (_isClickSymbol) {
            _label.text = btn.titleLabel.text;
            _isClickSymbol = NO;
        } else {
        
            _label.text = [NSString stringWithFormat:@"%lld",btn.titleLabel.text.longLongValue + _label.text.longLongValue * 10];
           
        }
    }
}


@end
