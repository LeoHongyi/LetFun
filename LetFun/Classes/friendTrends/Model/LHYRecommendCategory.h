//
//  LHYRecommendCategory.h
//  LetFun
//
//  Created by hongyi liu on 8/20/16.
//  Copyright © 2016 hongyi liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHYRecommendCategory : NSObject



/**id*/
@property(nonatomic, assign)NSInteger id;

@property(nonatomic, assign)NSInteger count;

@property(nonatomic, copy)NSString *name;


@property(nonatomic, strong)NSMutableArray *users;



@property(nonatomic, assign)NSInteger total;

//@property(nonatomic, assign)NSInteger next_page;

@property(nonatomic, assign)NSInteger currentPage;
@end
