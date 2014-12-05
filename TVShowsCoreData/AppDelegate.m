//
//  AppDelegate.m
//  TVShowsCoreData
//
//  Created by Daniel García on 28/10/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataManager.h"
#import "ViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSDate *lastStartDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastStartDate"];
    if (lastStartDate) {
        NSLog(@"Last start date was %@",lastStartDate);
    }
    lastStartDate = [NSDate date];
    [[NSUserDefaults standardUserDefaults] setObject:lastStartDate forKey:@"lastStartDate"];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    ViewController *mainViewController = [[ViewController alloc] init];

    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    NSString *plistName = @"shows.plist";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [paths firstObject];
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:cachePath error:nil];
    for (NSString *file in files) {
        if ([file isEqualToString:plistName]) {
            [[NSFileManager defaultManager]removeItemAtPath:[cachePath stringByAppendingPathComponent:file] error:nil];
        }
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
//    [self saveContext];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



@end
