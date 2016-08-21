


//
//  LHYRecommendCategory.m
//  LetFun
//
//  Created by hongyi liu on 8/20/16.
//  Copyright © 2016 hongyi liu. All rights reserved.
//

#import "LHYRecommendCategory.h"

@implementation LHYRecommendCategory

-(NSMutableArray *)users
{
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}



@end
