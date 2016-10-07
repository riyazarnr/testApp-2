//
//  HttpRequestManager.h
//  textApp
//
//  Created by SARA on 9/20/16.
//  Copyright © 2016 provenlogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequestManager : NSObject

+(id)sharedManager;

- (void)GETRequestWithUrl:(NSString *)urlStr withHandler:(void(^)(BOOL sucess, id response))handler;

@end
