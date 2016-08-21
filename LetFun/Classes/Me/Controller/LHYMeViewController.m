//
//  LHYMeViewController.m
//  LetFun
//
//  Created by hongyi liu on 8/18/16.
//  Copyright © 2016 hongyi liu. All rights reserved.
//

#import "LHYMeViewController.h"
#import "LHYSettingTableViewController.h"


@interface LHYMeViewController ()

@end

@implementation LHYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我";
    
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    UIBarButtonItem *nightModeButton = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(nighModeClick)];
    
    
    
    
    
    self.navigationItem.rightBarButtonItems = @[
                                                settingItem, nightModeButton
    
                                                ];
    self.view.backgroundColor = LHYGlobalBg;
}

-(void)settingClick
{
    //LHYLog(@"%s", __func__);
    LHYSettingTableViewController *settingVc = [[LHYSettingTableViewController alloc]init];
    settingVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVc animated:YES];
    
    
    
    
}

-(void)nighModeClick
{
     LHYLog(@"%s", __func__);
}

@end
