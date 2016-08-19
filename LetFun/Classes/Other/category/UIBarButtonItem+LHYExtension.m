//
//  UIBarButtonItem+LHYExtension.m
//  LetFun
//
//  Created by hongyi liu on 8/18/16.
//  Copyright © 2016 hongyi liu. All rights reserved.
//

#import "UIBarButtonItem+LHYExtension.h"

@implementation UIBarButtonItem (LHYExtension)
+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return [[self alloc] initWithCustomView:button];
    
}


@end
