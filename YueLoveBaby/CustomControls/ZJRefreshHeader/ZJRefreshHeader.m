//
//  ZJRefreshHeader.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/27.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJRefreshHeader.h"
static NSString *const ZJRefreshString = @"100%正品保证，假一赔十";
static float const logoWidth = 35.0f;

@interface ZJRefreshHeader()

@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) UIImageView *logo;
@property (weak, nonatomic) UIImageView *tranferLogo;
@end

@implementation ZJRefreshHeader

#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 50;
    
    // 添加label
    UILabel *label = [[UILabel alloc] init];
    label.textColor = mFontColor;
    label.font = mFont(12);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = ZJRefreshString;
    [self addSubview:label];
    self.label = label;
    
    // logo
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pull_to_refresh_header_image.png"]];
    logo.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:logo];
    self.logo = logo;
    
    UIImageView *tranferLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pull_to_refresh_header_loading.png"]];
    tranferLogo.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:tranferLogo];
    self.tranferLogo = tranferLogo;
    
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.label.frame = CGRectMake(0, self.mj_h - 30, KScreenWidth, 30);
    
    self.logo.bounds = CGRectMake(0, 0, logoWidth, logoWidth);
    self.logo.center = CGPointMake(KScreenWidth/2, - logoWidth + 20);
    
    self.tranferLogo.bounds = self.logo.bounds;
    self.tranferLogo.center = self.logo.center;
    
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    CABasicAnimation *baseAnim = nil;
    
    switch (state) {
        case MJRefreshStateIdle:
        {
            baseAnim = [self rotationWithDegree:M_PI direction:1];
            [self.tranferLogo.layer addAnimation:baseAnim forKey:@"1"];
            NSLog(@"start");
        }
            break;
        case MJRefreshStatePulling:
        {
            baseAnim = [self rotationWithDegree:M_PI*2 direction:1];
            [self.tranferLogo.layer addAnimation:baseAnim forKey:@"2"];
             NSLog(@"pull");
        }
            
            break;
        case MJRefreshStateRefreshing:
        {
            baseAnim = [self rotationWithDegree:M_PI*2 direction:1];
            [self.tranferLogo.layer addAnimation:baseAnim forKey:@"3"];
             NSLog(@"refresh");
        }
          
            break;
        default:
            break;
    }
}

#pragma mark ====旋转动画======
-(CABasicAnimation *)rotationWithDegree:(float)degree direction:(int)direction
{
   /*
    // myTransform = CATransform3DMakeRotation(M_PI, 0,1, 0)
    CATransform3D rotationTransform = CATransform3DMakeRotation(degree, 0, 0, direction);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration  =  0.5;
    animation.autoreverses = NO;
    animation.cumulative = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = ULLONG_MAX;
    //animation.delegate = self;
    */
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    [rotation setToValue:@(-M_PI*2)];
    
    [rotation setDuration:4];
    
    [rotation setRepeatCount:MAXFLOAT];
    
   // [rotaView.layer addAnimation:rotation forKey:@"rotation"];
    
    
    return rotation;
    
}

@end
