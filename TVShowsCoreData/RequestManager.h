//
//  RequestManager.h
//  TVShowsCoreData
//
//  Created by Daniel García on 29/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RequestManagerSuccess)(id data);
typedef void (^RequestManagerError)(NSError *error);

@interface RequestManager : NSObject
- (void)GET:(NSString *)path parameters:(NSDictionary *)parameters successBlock:(RequestManagerSuccess)successBlock errorBlock:(RequestManagerError)errorBlock;
@end
