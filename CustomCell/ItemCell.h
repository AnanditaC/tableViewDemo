//
//  ItemCell.h
//  tableViewDemo
//
//  Created by wipro on 18/05/18.
//  Copyright © 2018 wipro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface ItemCell : UITableViewCell

//properties
@property(nonatomic, strong) UIImageView *itemImageView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *descriptionLabel;

//methods
-(void)setDetails:(Model *)item;
-(void)setImageFromURL:(NSURL*)imageURL;

@end
