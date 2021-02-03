//
//  ZFCopyLabel.m
//  ZFZG
//
//  Created by Lee on 2021/2/3.
//

#import "ZFCopyLabel.h"

@interface ZFCopyLabel ()<UIGestureRecognizerDelegate>

@end

@implementation ZFCopyLabel

//绑定事件
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
   {
        [self attachTapHandler];
    }
    return self;
}
//同上
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self attachTapHandler];
}
-(BOOL)canBecomeFirstResponder
{
    return YES;
}
// 可以响应的方法
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(copyAction:));
}
//针对于响应方法的实现
-(void)copyAction:(id)sender
{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
}
-(void)attachTapHandler
{
    self.userInteractionEnabled = YES;  //用户交互的总开关
    UILongPressGestureRecognizer *touch = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    touch.delegate = self;
//    touch.minimumPressDuration = 1;
    [self addGestureRecognizer:touch];
}

-(void)handleTap:(UIGestureRecognizer*) recognizer
{
    if (recognizer.state == UIGestureRecognizerStateBegan){
        [self becomeFirstResponder];
        UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制"
                                                                 action:@selector(copyAction:)];
        [[UIMenuController sharedMenuController] setMenuItems:@[copyLink]];
        [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
        [[UIMenuController sharedMenuController] setMenuVisible:YES animated: YES];
    }
}

@end
