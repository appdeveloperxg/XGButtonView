//
//  AppDelegate.h
//  XGButtonView
//
//  Created by user on 2017/5/2.
//  Copyright © 2017年 郭晓广. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

