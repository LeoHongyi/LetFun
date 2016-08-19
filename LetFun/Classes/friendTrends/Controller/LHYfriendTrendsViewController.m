//
//  LHYfriendTrendsViewController.m
//  LetFun
//
//  Created by hongyi liu on 8/18/16.
//  Copyright © 2016 hongyi liu. All rights reserved.
//

#import "LHYfriendTrendsViewController.h"

@interface LHYfriendTrendsViewController ()

@end

@implementation LHYfriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的关注";

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
    self.view.backgroundColor = LHYGlobalBg;
    
    
}

-(void)friendsClick
{
    LHYLog(@"%s", __func__);
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    UIViewController *vc = [[UIViewController alloc]init];
//    vc.view.backgroundColor = LHYRGBColor(200, 100, 50);
//    [self.navigationController pushViewController:vc animated:YES];
//}




@end
