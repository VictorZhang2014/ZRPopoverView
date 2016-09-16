//
//  ZRPopoverView.h
//  ZRPopoverView
//
//  Created by VictorZhang on 9/12/16.
//  Copyright © 2016 xiaoruigege. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef __ZRPopoverView_
#define __ZRPopoverView_

#define kZRPopoverViewTitle @"ZRPopoverViewTitle"
#define kZRPopoverViewIcon  @"ZRPopoverViewIcon"

typedef  void(^ _Nullable MenuItemTouch)(int index);

typedef NS_ENUM(NSInteger)
{
    ZRPopoverViewStyleDefault,
    ZRPopoverViewStyleLightContent
}ZRPopoverViewStyle;

typedef NS_ENUM(NSInteger)
{
    ZRPopoverViewPositionLeftOfTop,
    ZRPopoverViewPositionCenterOfTop,
    ZRPopoverViewPositionRightOfTop
}ZRPopoverViewPosition;

@class ZRPopoverView;
@protocol ZRPopoverViewDelegate <NSObject>

- (void)popoverView:(ZRPopoverView * _Nullable)popoverView didClick:(int)index;

@end

@interface ZRPopoverView : UIView

@property (nonatomic, strong)  UIColor * _Nullable menuListBackgroundColor;

@property (nonatomic, assign) int menuListBackgroundAlpha;

@property (nonatomic, weak) _Nullable id<ZRPopoverViewDelegate> delegate;

- (nonnull instancetype)initWithStyle:(ZRPopoverViewStyle)popoverStyle menus:(nonnull NSArray*)menus position:(ZRPopoverViewPosition)position;

- (nonnull instancetype)initWithMenus:(nonnull NSArray*)menus position:(ZRPopoverViewPosition)position;

- (void)showWithController:(nonnull __kindof UIViewController *)viewController completion:(MenuItemTouch)completion;

- (void)showWithController:(nonnull __kindof UIViewController *)viewController;

- (void)dismiss:(void (^ _Nullable )(void))completion;

@end

#endif
