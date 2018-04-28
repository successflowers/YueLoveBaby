//
//  NumViewController.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/27.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "NumViewController.h"
static UILabel *label = nil;

static int totalNumber = 0;
static int copyNum = 0;

static BOOL isReset = NO;
static BOOL isFrist = YES;
static BOOL isFristReset = YES;

@interface NumViewController ()

@end

@implementation NumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"%d",totalNumber];
    label.frame = CGRectMake(100, 200, 200, 30);
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
    
    for (int i = 0; i<2; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(100+100*i, 100, 100, 30);
        
        btn.tag = i;
        [btn addTarget:self action:@selector(getNum:) forControlEvents:UIControlEventTouchUpInside];
        if (i==0) {
            [btn setTitle:@"获取数据" forState:UIControlStateNormal];
        }
        else
        {
            [btn setTitle:@"重置数据" forState:UIControlStateNormal];

        }
        [self.view addSubview:btn];
    }
}

- (void)getNum:(UIButton*)sender
{
    UIButton *button = (UIButton *)sender;
    int lanyaNum = 0;
   
    if (button.tag == 1) {
        isReset = YES;
        isFristReset = NO;
        copyNum = totalNumber;
    }
    else
    {
        int lanyaNumber = 100;
        lanyaNum = lanyaNumber;
        //如果第一次点击
        if (isFrist && isFristReset) { //假如首次点击获取但没点击重置
            isFrist = NO;
            totalNumber = lanyaNumber;
        }else if (!isFrist && isFristReset) //假如不是首次点击获取但没点击重置
        {
            totalNumber = lanyaNumber;
        }else if (!isFrist && !isFristReset) //假如不是首次点击获取但点击重置
        {
            if (isReset) {
                isReset = NO;
            }
            totalNumber = copyNum +lanyaNumber;
        }
    }
    
    label.text = [NSString stringWithFormat:@"%d",totalNumber];
    
    NSLog(@"蓝牙获取数据：%d     标签显示数据：%d    重置后标签保存数据： %d",lanyaNum, totalNumber, copyNum);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
