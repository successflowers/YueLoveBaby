//
//  ZJHomeViewController.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/21.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJHomeViewController.h"
NSString *const  ZJScrollBodyViewSendMessageNotification = @"ZJScrollBodyViewSendMessageNotification";
NSString *const ZJScrollTitleSendMessageNotification = @"ZJScrollTitleSendMessageNotification";

@interface ZJHomeViewController ()
@property (nonatomic, strong) ZJNavBar *navBar;
@property (nonatomic, strong) ZJScrollTitleBar *scrollTitleBar;
@property (nonatomic, strong) ZJScrollBodyView *scrollBodyView;

@property (nonatomic, strong) NSArray *zjTiltleArray;

@end

@implementation ZJHomeViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.backgroundColor = mBackgroudColor;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.scrollBodyView];
    [self.view addSubview:self.scrollTitleBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    [[ZJNetWorking sharedInstance] userRegistWithUserModelCallBack:^(BOOL isSucessed, id outParam, NSString *eMsg) {

        if (isSucessed) {
            NSLog(@"%@",outParam);
        }else
        {
            NSLog(@"eMsg = %@",eMsg);
        }
    }];
    
    [self test];
     */
}

- (void)test
{
    // 1.创建一个网络路径
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://groupapi.miyabaobei.com/age/index_banner"]];
    
    // 2.创建一个网络请求，分别设置请求方法、请求参数
    
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:url];
   // [request setValue:@"text/html" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    
    request.HTTPMethod = @"POST";
    
    NSString *args = [NSString stringWithFormat:@"auth_session=9bcc4fcc292343407024008f03889947"];
    
    request.HTTPBody = [args dataUsingEncoding:NSUTF8StringEncoding];
    
    // 3.获得会话对象
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    // 4.根据会话对象，创建一个Task任务
    
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"从服务器获取到数据");
        
        /*
         
         对从服务器获取到的数据data进行相应的处理.
         
         */
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:nil];
        NSLog(@"xxxxxx   %@",dict);
        
    }];
    
    //5.最后一步，执行任务，(resume也是继续执行)。
    
    [sessionDataTask resume];

}
#pragma mark - setter and getter
- (NSArray *)zjTiltleArray
{
    if (!_zjTiltleArray) {
        _zjTiltleArray = @[@"首页",@"甄选",@"全球购",@"婴童",@"童装",@"美妆",@"玩具",@"孕产",
                           @"女装",@"家具"];
    }
    return _zjTiltleArray;
}

- (ZJScrollTitleBar *)scrollTitleBar
{
    NSArray *array = self.zjTiltleArray;
    if (!_scrollTitleBar) {
        _scrollTitleBar = [[ZJScrollTitleBar alloc] initWithTitle:array];
        _scrollTitleBar.frame = CGRectMake(0, 52, KScreenWidth, 30);
        _scrollTitleBar.zjFont = [UIFont systemFontOfSize:18];
        _scrollTitleBar.zjItemGap = 5.0f;
        _scrollTitleBar.zjBarStyle = 0;
        _scrollTitleBar.zjFontColor = [UIColor blueColor];
        _scrollTitleBar.zjFontColorSelected = mMainColor;
        _scrollTitleBar.block = ^(int oldPath, int newPath) {
           // NSLog(@" oldPath = %d, new = %d, ",oldPath, newPath);
            NSDictionary *passDic = @{@"oldPath":[NSNumber numberWithInt:oldPath],
                                      @"newPath":[NSNumber numberWithInt:newPath]};
            [[NSNotificationCenter defaultCenter] postNotificationName:ZJScrollTitleSendMessageNotification object:passDic];
        };
    }
    return _scrollTitleBar;
}

- (ZJScrollBodyView *)scrollBodyView
{
    NSArray *array = self.zjTiltleArray;
    if (!_scrollBodyView) {
        _scrollBodyView = [[ZJScrollBodyView alloc] initWithTitle:array];
        _scrollBodyView.frame = CGRectMake(0, 52+30, KScreenWidth, KScreenHeight - (52+30+40));
        _scrollBodyView.block = ^(int oldPath, int newPath) {
             //NSLog(@" oldPath = %d, new = %d, ",oldPath, newPath);
            NSDictionary *passDic = @{@"oldPath":[NSNumber numberWithInt:oldPath],
                                      @"newPath":[NSNumber numberWithInt:newPath]};
            //ZJScrollTitleSendMessageNotification
            [[NSNotificationCenter defaultCenter] postNotificationName:ZJScrollBodyViewSendMessageNotification object:passDic];
        };
    }
    return _scrollBodyView;
}

- (ZJNavBar *)navBar
{
    if (!_navBar) {
        _navBar = [[ZJNavBar alloc] init];
        _navBar.navLine.hidden = YES;
        _navBar.callback = ^(BOOL isSucessed, NSString *textFiledStr) {
            
            NSLog(@"%@", textFiledStr);
        };
    }
    return _navBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
