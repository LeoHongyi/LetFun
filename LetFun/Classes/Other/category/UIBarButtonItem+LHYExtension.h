//
//  UIBarButtonItem+LHYExtension.h
//  LetFun
//
//  Created by hongyi liu on 8/18/16.
//  Copyright © 2016 hongyi liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LHYExtension)
+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
