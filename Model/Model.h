//
//  Model.h
//  tableViewDemo
//
//  Created by wipro on 18/05/18.
//  Copyright © 2018 wipro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *detail;
@property(nonatomic, strong) NSURL *imageURL;

+(NSMutableArray *)getModelArrayFromJson:(NSArray *)array;

@end
