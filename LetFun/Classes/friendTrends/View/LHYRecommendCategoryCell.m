//
//  LHYRecommendCategoryCell.m
//  LetFun
//
//  Created by hongyi liu on 8/20/16.
//  Copyright © 2016 hongyi liu. All rights reserved.
//

#import "LHYRecommendCategoryCell.h"
#import "LHYRecommendCategory.h"

@interface LHYRecommendCategoryCell()
@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;


@end

@implementation LHYRecommendCategoryCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = LHYRGBColor(244, 244, 244);
    self.textLabel.textColor = LHYRGBColor(78, 78, 78)
    ;
    self.textLabel.highlightedTextColor = LHYRGBColor(219, 21, 26);
    UIView *bg = [[UIView alloc]init];
    bg.backgroundColor = [UIColor clearColor];
    
    self.selectedBackgroundView = bg;
    
}

-(void)setCategory:(LHYRecommendCategory *)category
{
    _category =  category;
    
    self.textLabel.text = category.name;
    
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 2 * self.textLabel.y;
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated

{
    [super setSelected:selected animated:animated];
    self.selectedIndicator.hidden = !selected;
    
    self.textLabel.textColor = selected ? LHYRGBColor(219, 21, 26) : LHYRGBColor(78, 78, 78);
    
}
@end
