//
//  ViewController.h
//  tableViewDemo
//
//  Created by wipro on 18/05/18.
//  Copyright © 2018 wipro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;


@end

