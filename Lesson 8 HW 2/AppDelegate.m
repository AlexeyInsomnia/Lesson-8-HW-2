//
//  AppDelegate.m
//  Lesson 8 HW 2
//
//  Created by Alex on 16.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "AppDelegate.h"
#import "APStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSArray* arrayName = [[NSArray alloc] initWithObjects:@"Celica", @"Boris",@"Andrew",@"Durango", nil];
    
    NSArray* arrayLastName = [[NSArray alloc] initWithObjects:@"Stevenson", @"Armaginskiy",@"Golt",@"Snow", nil];
    
    NSArray* arrayHello = [[NSArray alloc] initWithObjects:@"Hi, master", @"Yo man",@"Hello there",@"How R U", nil];
    
    NSMutableDictionary* dictionary = [[NSMutableDictionary alloc ] init];
    
    NSMutableArray* arrayKeys = [[NSMutableArray alloc] init];

    
    NSLog(@"**************** baby mode is ON, tasks 1-4***********");
    
    for (int i=0; i<[arrayName count]; i++) {
        
        APStudent* student = [[APStudent alloc ] init];
        student.name = [arrayName objectAtIndex:i];
        student.lastName = [arrayLastName objectAtIndex:i];
        student.hello = [arrayHello objectAtIndex:i];
        
        NSString* namePlusLastName = [NSString stringWithFormat:@"%@ %@", [arrayName objectAtIndex:i],
                                      [arrayLastName objectAtIndex:i]];
        [arrayKeys addObject:namePlusLastName];
        
        [dictionary setObject:student forKey:namePlusLastName  ];
        
       // dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:student, namePlusLastName, nil];
        
        NSLog(@"hi, anybody here ?  %@ ", dictionary);
    }
    
    NSLog(@"****************student mode is ON, task 5***********");
   
    
    
    for (NSString* keys in [dictionary allKeys] ) {
        id objs = [dictionary objectForKey:keys];
        NSLog(@"key = %@, value = %@", keys, objs);
    }
    
    NSLog(@"**************** master mode is ON, task 6*********** USING COMPARATOR");
    
    NSArray* newSortedArrayOfKeys = [NSArray arrayWithArray:arrayKeys];
    
    newSortedArrayOfKeys = [newSortedArrayOfKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        return  [(NSString*)obj1 compare:(NSString*)obj2];
    }];
    
    NSLog(@"check it out - sorted by Comparator ");
    
    for (NSString* keys in newSortedArrayOfKeys ) {
        id objs = [dictionary objectForKey:keys];
        NSLog(@"key = %@, value = %@", keys, objs);
    }
 
    NSLog(@"**************** master mode is ON, task 6*********** USING SELECTOR");
    
    NSLog(@"check it out - not sorted is  - %@ \n AND NOW - SORTED BY SELECTOR", arrayKeys);
    
    NSArray* arraySortKey = [arrayKeys sortedArrayUsingSelector:@selector(compare:) ];
    
    for (NSString* keySort in arraySortKey) {
        id obj = [dictionary objectForKey:keySort];
        NSLog(@"key = %@, value = %@", keySort, obj);
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
