//
//  LHYRecommnedViewController.m
//  LetFun
//
//  Created by hongyi liu on 8/19/16.
//  Copyright © 2016 hongyi liu. All rights reserved.
//

#import "LHYRecommnedViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import "LHYRecommendCategoryCell.h"
#import <MJExtension.h>
#import "LHYRecommendCategory.h"
#import "LHYRecommendUserCell.h"
#import "LHYRecommendUser.h"
#import <MJRefresh.h>
#define LHYSelectedCategory self.categories[self.categoryTableView.indexPathForSelectedRow.row]


@interface LHYRecommnedViewController ()<UITableViewDataSource, UITableViewDelegate >
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;


@property(nonatomic, strong)NSArray *categories;
//@property(nonatomic, strong)NSArray *users;

@end

@implementation LHYRecommnedViewController

static NSString *const LHYCategoryId = @"category";
static NSString *const LHYUserId = @"user";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupRefresh];
//    // Do any additional setup after loading the view from its nib.
//    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LHYRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:LHYCategoryId];
//    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LHYRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:LHYUserId];
//    
//    self.title = @"推荐关注";
//    self.view.backgroundColor = LHYGlobalBg;
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        //self.categories = responseObject[@"list"];
        self.categories = [LHYRecommendCategory objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.categoryTableView reloadData];
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
        
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //[SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败"];
    }];
}


-(void)setupTableView
{
    // Do any additional setup after loading the view from its nib.
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LHYRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:LHYCategoryId];
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LHYRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:LHYUserId];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.contentInset = self.categoryTableView.contentInset;
    self.userTableView.rowHeight = 70;
    self.title = @"推荐关注";
    self.view.backgroundColor = LHYGlobalBg;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.categoryTableView) {
        return self.categories.count;
    } else {
//        LHYRecommendCategory * c = self.categories[self.categoryTableView.indexPathForSelectedRow.row];
        NSInteger count = [LHYSelectedCategory users].count;
        self.userTableView.footer.hidden = (count == 0);
        return count;
        //return self.users.count;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView) {
        LHYRecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:LHYCategoryId];
        cell.category = self.categories[indexPath.row];
        
        
        return cell;
    } else {
        LHYRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:LHYUserId];
        //LHYRecommendCategory * c = self.categories[self.categoryTableView.indexPathForSelectedRow.row];
        cell.user = [LHYSelectedCategory users][indexPath.row];
        return cell;
        
    }
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    LHYRecommendCategory *c = self.categories[indexPath.row];
    
    if (c.users.count) {
        [self.userTableView reloadData];
    } else {
        c.currentPage = 1;
        
        [self.userTableView reloadData];
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"list";
        params[@"c"] = @"subscribe";
        params[@"category_id"] = @(c.id);
        params[@"page"] = @(c.currentPage);
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LHYLog(@"%@",responseObject[@"list"]);
        NSArray *users = [LHYRecommendUser objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [c.users addObjectsFromArray:users];
        
         c.total = [responseObject[@"total"] integerValue];
        
            
        //LHYLog(@"%@",users);
        [self.userTableView reloadData];
            
        if (c.users.count == c.total) {
            [self.userTableView.footer noticeNoMoreData];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LHYLog(@"%@",error );
     }];
    }
}

-(void)setupRefresh
{
    self.userTableView.footer = [MJRefreshAutoNormalFooter  footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    self.userTableView.footer.hidden = YES;
}

-(void)loadMoreUsers
{
    LHYRecommendCategory *category = LHYSelectedCategory;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(category.id);
    params[@"page"] = @(++category.currentPage);
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LHYLog(@"%@",responseObject[@"list"]);
        NSArray *users = [LHYRecommendUser objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [category.users addObjectsFromArray:users];
        
        //LHYLog(@"%@",users);
        [self.userTableView reloadData];
        
        if (category.users.count == category.total) {
            [self.userTableView.footer noticeNoMoreData];
        } else {
            [self.userTableView.footer endRefreshing];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LHYLog(@"%@",error );
    }];
    
}

@end
