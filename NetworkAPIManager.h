//
//  NetworkAPIManager.h
//  tableViewDemo
//
//  Created by wipro on 18/05/18.
//  Copyright © 2018 wipro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkAPIManager : NSObject

// For Fetching TItle and description
+(void)fetchData:(void (^)(NSDictionary *result, NSError *error))completion;

//For downloading images in cell
+(void)downloadImage:(NSURL *)imgURL completion:(void (^)(NSData *imageData, NSError *error))completion;

@end
