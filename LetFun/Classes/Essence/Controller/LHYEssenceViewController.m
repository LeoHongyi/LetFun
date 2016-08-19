 //
//  LHYEssenceViewController.m
//  LetFun
//
//  Created by hongyi liu on 8/18/16.
//  Copyright © 2016 hongyi liu. All rights reserved.
//

#import "LHYEssenceViewController.h"


@interface LHYEssenceViewController ()

@end

@implementation LHYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //set title of navigationitem
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    self.view.backgroundColor = LHYGlobalBg;
    
    
    
    //
    
    
}

-(void)tagClick
{
    LHYLog(@"%s", __func__);
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    
//    LHYTestViewController *vc = [[LHYTestViewController alloc]init];
//    //vc.view.backgroundColor = LHYRGBColor(200, 100, 50);
//    [self.navigationController pushViewController:vc animated:YES];
//    
//    
//}




@end
