//
//  ZRPopoverView.m
//  ZRPopoverView
//
//  Created by VictorZhang on 9/12/16.
//  Copyright © 2016 xiaoruigege. All rights reserved.
//

#import "ZRPopoverView.h"

#define TRANSLUCENT_RATE 0.85

@interface ZRPopoverViewTriangle : UIView

@property (nonatomic, strong)  UIColor * _Nullable menuListBackgroundColor;

@property (nonatomic, assign) int menuListBackgroundAlpha;

@property (nonatomic, assign) ZRPopoverViewStyle popoverStyle;

@end

@implementation ZRPopoverViewTriangle

- (instancetype)initWithFrame:(CGRect)frame withStyle:(ZRPopoverViewStyle)popoverStyle
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;//It's very important, background always black if we don't set the property opaque equals NO
        _popoverStyle = popoverStyle;
    }
    return self;
}

- (void)setMenuListBackgroundAlpha:(int)menuListBackgroundAlpha
{
    _menuListBackgroundAlpha = menuListBackgroundAlpha;
    if (_popoverStyle == ZRPopoverViewStyleDefault) {
        if (self.menuListBackgroundAlpha >= 0) {
            self.alpha = self.menuListBackgroundAlpha;
        }else {
            self.alpha = TRANSLUCENT_RATE;
        }
    }
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    int half = rect.size.width / 2;
    int width = rect.size.width;
    int height = rect.size.height;
    
    [path moveToPoint:CGPointMake(half, 0)];
    [path addLineToPoint:CGPointMake(width, height)];
    [path addLineToPoint:CGPointMake(0, height)];
    [path addLineToPoint:CGPointMake(half, 0)];
    [path closePath];
    
    UIColor *color = nil;
    if (self.popoverStyle == ZRPopoverViewStyleLightContent) {
        color = [UIColor whiteColor];
    } else {
        if (self.menuListBackgroundColor) {
            color  = self.menuListBackgroundColor;
        } else {
           color = [UIColor blackColor];
        }
    }
    
    [color setFill];
    [path fill];
    
//    [color setStroke];
//    [path stroke];
}

@end


#define MENUITEM_WIDTH 150

@interface ZRPopoverView()

@property (nonatomic, assign) ZRPopoverViewStyle popoverStyle;

@property (atomic, strong)  NSArray* _Nonnull menusList;

@property (nonatomic, strong) __kindof UIViewController *selfController;

@property (nonatomic, strong) UIView *menus;

@property (nonatomic, copy) MenuItemTouch menuItemTouch;

@property (nonatomic, assign) ZRPopoverViewPosition popoverPosition;

@property (nonatomic, assign) BOOL isDrawnUI;
@end

@implementation ZRPopoverView

- (nonnull instancetype)initWithStyle:(ZRPopoverViewStyle)popoverStyle menus:(nonnull NSArray*)menus position:(ZRPopoverViewPosition)position
{
    if (self = [super init]) {
        _menusList = menus;
        _popoverStyle = popoverStyle;
        _popoverPosition = position;
        _menuListBackgroundAlpha = -1;
    }
    return self;
}

- (nonnull instancetype)initWithMenus:(nonnull NSArray*)menus position:(ZRPopoverViewPosition)position;
{
    if (self = [super init]) {
        _menusList = menus;
        _popoverStyle = ZRPopoverViewStyleDefault;
        _popoverPosition = position;
        _menuListBackgroundAlpha = -1;
    }
    return self;
}

- (void)showWithController:(nonnull __kindof UIViewController *)viewController completion:(MenuItemTouch)completion
{
    [self showWithController:viewController];
    _menuItemTouch = completion;
}

- (void)showWithController:(nonnull __kindof UIViewController *)viewController
{
    _selfController = viewController;
    if (![self removeLastPopoverView]) {
        return;
    }
    [self drawUI];
    
    //Animation
    self.alpha = 0.0;
    CGRect originalRect = self.menus.frame;
    CGRect changeRect = self.menus.frame;
    changeRect.origin.y = -changeRect.size.width;
    self.menus.frame = changeRect;
    [viewController.view addSubview:self];
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1.0;
        self.menus.frame = originalRect;
    } completion:nil];
}

- (void)dismiss
{
    __weak typeof(self) SELF = self;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        SELF.alpha = 0.0;
        CGRect changeRect = SELF.menus.frame;
        changeRect.origin.y = -changeRect.size.height;
        SELF.menus.frame = changeRect;
    } completion:^(BOOL finished) {
        if (finished) {
            [SELF removeFromSuperview];
        }
    }];
}

- (BOOL)removeLastPopoverView
{
    UIView *lastView = [self.selfController.view.subviews lastObject];
    if ([lastView isKindOfClass:[ZRPopoverView class]]) {
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            lastView.alpha = 0.0;
            
            ZRPopoverView *tmpView = (ZRPopoverView *)lastView;
            CGRect changeRect = tmpView.menus.frame;
            changeRect.origin.y = -changeRect.size.height;
            tmpView.menus.frame = changeRect;
        } completion:^(BOOL finished) {
            if (finished) {
                [lastView removeFromSuperview];
            }
        }];
        return NO;
    }
    return YES;
}

- (void)drawUI
{
    if (self.isDrawnUI) {
        return;
    }
    self.isDrawnUI = YES;
    
    CGFloat margin = 8;
    CGFloat buttonheight = 38;
    CGFloat oW = MENUITEM_WIDTH;
    CGFloat thinLineHeight = 0.5;
    
    CGRect fullRect = [UIScreen mainScreen].bounds;
    
    //Whole view's background
    UIView *wholeView = [[UIView alloc] initWithFrame:fullRect];
    [wholeView setBackgroundColor:[UIColor blackColor]];
    [wholeView setAlpha:0.1];
    [wholeView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)]];
    [self addSubview:wholeView];
    
    //Menu's background
    CGFloat oH = self.menusList.count * buttonheight + (self.menusList.count - 1) * thinLineHeight;
    CGFloat oX = 0;
    CGFloat oY = 75;
    if (self.popoverPosition == ZRPopoverViewPositionCenterOfTop) {
        oX = (fullRect.size.width - oW) / 2;
    } else if (self.popoverPosition == ZRPopoverViewPositionLeftOfTop) {
        oX = 10;
    } else {
        oX = fullRect.size.width - oW - margin;
    }
    CGRect viewRect = CGRectMake(oX, oY, oW, oH);
    UIView *viewBg = [[UIView alloc] initWithFrame:viewRect];
    viewBg.layer.cornerRadius = 8;
    viewBg.backgroundColor = [self accordingToStyle2];
    if (self.popoverStyle == ZRPopoverViewStyleDefault) {
        if (self.menuListBackgroundAlpha >= 0) {
            viewBg.alpha = self.menuListBackgroundAlpha;
        } else {
            viewBg.alpha = TRANSLUCENT_RATE;
        }
        if (self.menuListBackgroundColor) {
            viewBg.backgroundColor = self.menuListBackgroundColor;
        }
    }
    [self addSubview:viewBg];
    self.menus = viewBg;
    
    for (int i = 0; i < self.menusList.count; i++) {
        NSDictionary *dic = [self.menusList objectAtIndex:i];
        NSString *text = dic[kZRPopoverViewTitle];
        NSString *icon = dic[kZRPopoverViewIcon];

        CGFloat bY = buttonheight * i;
        CGFloat lY = buttonheight * (i + 1);
        
        //Add button and icon
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, bY, oW, buttonheight)];
        [button setTitle:text forState:UIControlStateNormal];
        [button setTitleColor:[self accordingToStyle1] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [button setTag:i];
        [button addTarget:self action:@selector(menuItemTouch:) forControlEvents:UIControlEventTouchUpInside];
        if (icon.length) {
            [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
            [button.titleLabel setTextAlignment:NSTextAlignmentLeft];
            button.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
            button.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
            [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        }
        [viewBg addSubview:button];
        
        //Add straight line
        if (self.menusList.count > 1 && i != self.menusList.count - 1) {
            CGRect lineRect = CGRectMake(margin, lY, oW - margin * 2, thinLineHeight);
            UILabel *centreLine = [[UILabel alloc] initWithFrame:lineRect];
            [centreLine setBackgroundColor:[UIColor grayColor]];
            [centreLine setAlpha:0.5];
            if (self.popoverStyle == ZRPopoverViewStyleLightContent) {
                lineRect = CGRectMake(0, lY, oW, thinLineHeight);
                [centreLine setFrame:lineRect];
            }
            [viewBg addSubview:centreLine];
        }
    }

    [self setFrame:fullRect];
    
    //Calculate the small triangle position
    CGFloat tW = 10;
    CGFloat tH = tW;
    CGFloat tX = 0;
    CGFloat tY = oY - 10;
    switch (self.popoverPosition) {
        case ZRPopoverViewPositionLeftOfTop:
            tX = 20;
            break;
        case ZRPopoverViewPositionCenterOfTop:
            tX = (fullRect.size.width - tW) / 2;
            break;
        case ZRPopoverViewPositionRightOfTop:
            tX = fullRect.size.width - tW - 20;
            break;
        default:
            break;
    }
    ZRPopoverViewTriangle *triangle = [[ZRPopoverViewTriangle alloc] initWithFrame:CGRectMake(tX, tY, tW, tH) withStyle:self.popoverStyle];
    triangle.menuListBackgroundColor = self.menuListBackgroundColor;
    triangle.menuListBackgroundAlpha = self.menuListBackgroundAlpha;
    [self addSubview:triangle];
}

#pragma mark - Menu's item click event
- (void)menuItemTouch:(UIButton *)button
{
    [self dismiss];
    int index = (int)button.tag;
    if (self.menuItemTouch) {
        self.menuItemTouch(index);
    } else {
        if ([self.delegate respondsToSelector:@selector(popoverView:didClick:)]) {
            [self.delegate popoverView:self didClick:index];
        }
    }
}

- (UIColor *)accordingToStyle1
{
    if (self.popoverStyle == ZRPopoverViewStyleLightContent) {
        return [UIColor blackColor];
    }
    return [UIColor whiteColor];
}

- (UIColor *)accordingToStyle2
{
    if (self.popoverStyle == ZRPopoverViewStyleLightContent) {
        return [UIColor whiteColor];
    }
    return [UIColor blackColor];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect rect = [UIScreen mainScreen].bounds;
    BOOL value = CGRectContainsPoint(rect, point);
    NSArray *arrays = [self subviews];
    for (UIView *view in arrays) {
        value = CGRectContainsPoint(view.frame, point);
        if (value) {
            return value;
        }
    }
    return NO;
}

- (void)dealloc
{
    NSLog(@"ZRPopoverView is dealloc!");
}

@end

