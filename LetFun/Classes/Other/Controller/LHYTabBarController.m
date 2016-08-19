//
//  LHYTabBarController.m
//  LetFun
//
//  Created by hongyi liu on 8/18/16.
//  Copyright © 2016 hongyi liu. All rights reserved.
//

#import "LHYTabBarController.h"
#import "LHYMeViewController.h"
#import "LHYEssenceViewController.h"
#import "LHYNewViewController.h"
#import "LHYfriendTrendsViewController.h"
#import "LHYTabBar.h"
#import "LHYUINavigationController.h"


@interface LHYTabBarController ()

@end

@implementation LHYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self setChildVc:[[LHYEssenceViewController alloc]init] title:  @"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setChildVc:[[LHYNewViewController alloc]init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    [self setChildVc:[[LHYfriendTrendsViewController alloc]init]  title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setChildVc:[[LHYMeViewController alloc]init]  title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
   

     [self setValue:[[LHYTabBar alloc] init] forKeyPath:@"tabBar"];
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
}


-(void)setChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *) image selectedImage:(NSString *)selectedImage{
    
    
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    //vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0  blue:arc4random_uniform(100)/100.0  alpha:1.0];
    LHYUINavigationController *nav = [[LHYUINavigationController alloc]initWithRootViewController:vc];
    
    
    [self addChildViewController:nav];
    
    
    //[self addChildViewController:vc];
    
    
    
    
}

@end
