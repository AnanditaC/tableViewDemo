//
//  NetworkAPIManager.m
//  tableViewDemo
//
//  Created by wipro on 18/05/18.
//  Copyright © 2018 wipro. All rights reserved.
//

#import "NetworkAPIManager.h"

static NSString *APIPath = @"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json";

@implementation NetworkAPIManager

+(void)fetchData:(void (^)(NSDictionary *result, NSError *error))completion {
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:APIPath]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSError* error = nil;
        
        NSString *iso = [[NSString alloc] initWithData:data encoding:NSISOLatin1StringEncoding];
        NSData *dutf8 = [iso dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:dutf8 options:0 error:&error];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (json != nil) {
                completion(json, nil);
            } else {
                NSLog(@"error: %@", error);
                completion(nil, error);
            }
        });
    }];
}

+(void)downloadImage:(NSURL *)imgURL completion:(void (^)(NSData *imageData, NSError *error))completion {
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:imgURL] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (!connectionError) {
            completion(data, nil);
        }else{
            completion(nil, connectionError);
            NSLog(@"%@",connectionError);
        }
    }];
}
@end
