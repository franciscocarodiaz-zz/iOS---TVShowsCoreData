//
//  IHOperation.m
//  TVShowsCoreData
//
//  Created by Daniel García on 30/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "IHOperation.h"

@implementation IHOperation{
    BOOL _isExecuting;
    BOOL _isFinished;
    BOOL _isConcurrent;
    BOOL _isCanceled;
}
#pragma mark - NSOperation
- (BOOL)isConcurrent{
    return YES;
}
- (void)start{
    if (_isCanceled) {
        [self finish];
        return;
    }
    [self willChangeValueForKey:@"isExecuting"];
    _isExecuting = YES;
    [self didChangeValueForKey:@"isExecuting"];
}
- (BOOL)isExecuting{
    return _isExecuting;
}
- (void)cancel{
    [self willChangeValueForKey: @"isExecuting"];
    [self willChangeValueForKey:@"isCanceled"];
    _isExecuting = NO;
    _isCanceled = YES;
    [self didChangeValueForKey:@"isCanceled"];
    [self didChangeValueForKey: @"isExecuting"];
}
- (BOOL)isCancelled{
    return _isCanceled;
}
- (void)finish {
    [self willChangeValueForKey: @"isExecuting"];
    [self willChangeValueForKey: @"isFinished"];
    _isExecuting = NO;
    _isFinished = YES;
    [self didChangeValueForKey: @"isFinished"];
    [self didChangeValueForKey: @"isExecuting"];
}
- (BOOL)isFinished{
    return _isFinished;
}
@end
