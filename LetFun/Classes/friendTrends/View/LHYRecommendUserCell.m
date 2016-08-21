//
//  LHYRecommendUserCell.m
//  LetFun
//
//  Created by hongyi liu on 8/21/16.
//  Copyright © 2016 hongyi liu. All rights reserved.
//

#import "LHYRecommendUserCell.h"
#import "LHYRecommendUser.h"
#import  <UIImageView+WebCache.h>

@interface LHYRecommendUserCell()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;
    

@end

@implementation LHYRecommendUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setUser:(LHYRecommendUser *)user
{
    _user = user;
    self.screenNameLabel.text = user.screen_name;
    self.fansCountLabel.text = [NSString stringWithFormat:@"%zd关注",user.fans_count];
    
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    
}

@end
