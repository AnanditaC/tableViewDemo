//
//  Model.m
//  tableViewDemo
//
//  Created by wipro on 18/05/18.
//  Copyright © 2018 wipro. All rights reserved.
//

#import "Model.h"

@implementation Model

+(NSMutableArray *)getModelArrayFromJson:(NSArray *)array {
    
    NSMutableArray *itemArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        if ([dict objectForKey:@"title"] != [NSNull null] || [dict objectForKey:@"description"] != [NSNull null] || [dict objectForKey:@"imageHref"] != [NSNull null]) {
            
            Model *item = [[Model alloc]init];
            if ([dict objectForKey:@"title"] != [NSNull null]) {
                item.title = [dict objectForKey:@"title"];
            }
            
            if ([dict objectForKey:@"description"] != [NSNull null]) {
                item.detail = [dict objectForKey:@"description"];
            }
            
            if ([dict objectForKey:@"imageHref"] != [NSNull null]) {
                NSString *imageURLAsString = [dict objectForKey:@"imageHref"];
                [imageURLAsString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                NSURL *imgURL = [NSURL URLWithString:imageURLAsString];
                item.imageURL = imgURL;
            }
            
            [itemArray addObject:item];
        }
    }
    
    return itemArray;
}
@end
