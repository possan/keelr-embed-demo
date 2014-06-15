//
//  AppDelegate.m
//  keelr-embed-demo
//
//  Created by Per-Olov Jernberg on 2014-06-09.
//  Copyright (c) 2014 Per-Olov Jernberg. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
            

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    NSLog(@"handleOpenURL %@", url);
    NSArray *components = [url.fragment componentsSeparatedByString:@"&"];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    for (NSString *component in components) {
        NSArray *subcomponents = [component componentsSeparatedByString:@"="];
        [parameters setObject:[[subcomponents objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
                       forKey:[[subcomponents objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    NSLog(@"parameters %@", parameters);

    NSString *accessToken = [parameters objectForKey:@"access_token"];
    if (accessToken) {
        [self.controller setAuthAccessToken:accessToken];
    } else {
        [self.controller setAuthError:@"unknown"];
    }
    return TRUE;
}

@end
