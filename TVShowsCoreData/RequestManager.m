//
//  RequestManager.m
//  TVShowsCoreData
//
//  Created by Daniel García on 29/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "RequestManager.h"
#import <AFNetworking/AFNetworking.h>

@interface RequestManager()
@property (copy,nonatomic) NSString *baseDomain;
@end
@implementation RequestManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        _baseDomain=@"http://api.trakt.tv";
    }
    return self;
}
- (void)GET:(NSString *)path parameters:(NSDictionary *)parameters successBlock:(RequestManagerSuccess)successBlock errorBlock:(RequestManagerError)errorBlock{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:[self.baseDomain stringByAppendingPathComponent:path] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        successBlock(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        errorBlock(error);
        
    }];
}
@end
