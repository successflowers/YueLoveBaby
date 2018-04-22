//
//  ZJJumpIndicator.m
//  YueBaby
//
//  Created by 张敬 on 2018/4/18.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJJumpIndicator.h"
typedef NS_ENUM(NSInteger, ZJJumpIndicatorState)
{
    ZJJumpIndicatorStateTop = 0,
    ZJJumpIndicatorStateDown
};

static float circleW = 0.f;
static float const imageScal = 16.0f;
static float const myTime = 0.5f;
static ZJJumpIndicatorState myState = ZJJumpIndicatorStateTop;
static  CABasicAnimation *jump = nil;

@interface ZJJumpIndicator()
@property (nonatomic, strong) CALayer *imageALayer;
@property (nonatomic, strong) CALayer *imageBLayer;
@property (nonatomic, strong) CAShapeLayer *circle;

@end

@implementation ZJJumpIndicator
- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        circleW = frame.size.width;
        self.clipsToBounds = YES;
        [self.layer addSublayer:self.circle];
        [self.layer addSublayer:self.imageBLayer];
        [self.layer addSublayer:self.imageALayer];
        [self addTarget:self action:@selector(didclicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _imageALayer.frame = CGRectMake(imageScal/2.0, imageScal/2.0, circleW-imageScal, circleW-imageScal);
    _imageBLayer.frame = CGRectMake(imageScal/2.0, circleW, circleW-imageScal, circleW-imageScal);
}

#pragma mark response
- (void)didclicked:(id)sender
{
    switch (myState) {
        case ZJJumpIndicatorStateTop:
        {
            myState = ZJJumpIndicatorStateDown;
            //A_Top B_TOP
            CABasicAnimation *imageATopAin = [[CABasicAnimation animation] moveYPositionWithFrom:imageScal/2.0 to:-circleW/2.0];
            imageATopAin.duration = myTime;
            [_imageALayer addAnimation:imageATopAin forKey:@"imageATopAin"];
            
            CABasicAnimation *imageBTopAin = [[CABasicAnimation animation] moveYPositionWithFrom:circleW to:circleW/2.0];
            imageBTopAin.duration = myTime;
            [_imageBLayer addAnimation:imageBTopAin forKey:@"imageBTopAin"];
           
            if (self.stateTopBlock) {
                self.stateTopBlock();
            }
        }
            break;
        case ZJJumpIndicatorStateDown:
        {
            myState = ZJJumpIndicatorStateTop;
            
            //A_Down B_Down
            CABasicAnimation *imageADownAin =[[CABasicAnimation animation] moveYPositionWithFrom:-circleW to:circleW/2];
            imageADownAin.duration = myTime;
            [_imageALayer addAnimation:imageADownAin forKey:@"imageADownAin"];
            
            CABasicAnimation *imageBDownAin = [[CABasicAnimation animation] moveYPositionWithFrom:circleW/2 to:circleW*2];
            imageBDownAin.duration = myTime;
            [_imageBLayer addAnimation:imageBDownAin forKey:@"imageBDownAin"];
            if (self.stateDownBlock) {
                self.stateDownBlock();
            }
        }
            break;
        default:
            break;
    }
}



#define mark - setter and getter
- (void)setImageTop:(UIImage *)imageTop
{
    if (_imageTop != imageTop) {
        _imageTop = imageTop;
    }
    _imageALayer.contents = (__bridge id)imageTop.CGImage;
}
- (void)setImageDown:(UIImage *)imageDown
{
    if (_imageDown != imageDown) {
        _imageDown = imageDown;
    }
     _imageBLayer.contents = (__bridge id)imageDown.CGImage;
}

- (void)setBackColor:(UIColor *)backColor
{
    if (_backColor != backColor) {
        _backColor = backColor;
    }
     _circle.fillColor = backColor.CGColor;
}

- (void)setAnimationTime:(float)animationTime
{
    if (_animationTime !=animationTime) {
        _animationTime = animationTime;
    }
     jump.duration = animationTime;
}

- (CAShapeLayer *)circle
{
    if (!_circle) {
        _circle = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, circleW, circleW) cornerRadius:circleW/2.0];
        _circle.path = path.CGPath;
    }
    return _circle;
}

- (CALayer *)imageALayer
{
    if (!_imageALayer) {
        _imageALayer = [CALayer layer];
        //_imageALayer.backgroundColor = KYellowColor.CGColor;
        _imageALayer.contentsGravity = kCAGravityResizeAspect;
    }
    return _imageALayer;
}

- (CALayer *)imageBLayer
{
    if (!_imageBLayer) {
        _imageBLayer = [CALayer layer];
       // _imageBLayer.backgroundColor = KGrayColor.CGColor;
        _imageBLayer.contentsGravity = kCAGravityResizeAspect;
    }
    return _imageBLayer;
}

@end
