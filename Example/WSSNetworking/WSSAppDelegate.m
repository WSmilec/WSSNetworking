//
//  WSSAppDelegate.m
//  WSSNetworking
//
//  Created by smile on 08/22/2019.
//  Copyright (c) 2019 smile. All rights reserved.
//

#import "WSSAppDelegate.h"
#import "TestNetworkHandle.h"
#import <WSSNetworking/WSSNetworking.h>
#import <WSSNetworking/WSSNetworkReachabilityManager.h>
@interface WSSAppDelegate ()
@property (nonatomic, strong) WSSNetworkReachabilityManager *networkReachabilityManager;
@end
@implementation WSSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [WSSNetworkConfig sharedConfig].baseUrl = @"http://XXXX";
    [WSSNetworkConfig sharedConfig].debugLogEnabled = YES;
    [WSSNetworkConfig sharedConfig].networkProtocol = [TestNetworkHandle sharedProtocol];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkChanged:) name:kWSSNetworkReachabilityChangedNotification object:nil];
    self.networkReachabilityManager = [WSSNetworkReachabilityManager reachability];
    [self.networkReachabilityManager startMonitoring];
    WSSNetworkReachabilityStatus networkStatus = [self.networkReachabilityManager currentReachabilityStatus];

    
    return YES;
}
- (void)networkChanged:(NSNotification *)notif {
    NSDictionary *userInfo = notif.userInfo;
    WSSNetworkReachabilityStatus networkStatus = [userInfo[kWSSNetworkingReachabilityNotificationStatusItem] integerValue];
   
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
