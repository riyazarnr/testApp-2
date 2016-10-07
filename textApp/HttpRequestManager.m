//
//  HttpRequestManager.m
//  textApp
//
//  Created by SARA on 9/20/16.
//  Copyright © 2016 provenlogic. All rights reserved.
//

#import "HttpRequestManager.h"

@implementation HttpRequestManager 

+(id)sharedManager
{
    static HttpRequestManager *manager = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

- (void)GETRequestWithUrl:(NSString *)urlStr withHandler:(void(^)(BOOL sucess, id response))handler;
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSArray *dataArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSLog(@"requested  Data %@",dataArr);
            handler(YES,dataArr);
        }
        else{
            handler(NO,nil);
        }
    }];
    [dataTask resume];

}

@end
