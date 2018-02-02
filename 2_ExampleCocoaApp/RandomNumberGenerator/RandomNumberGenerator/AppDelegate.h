//
//  AppDelegate.h
//  RandomNumberGenerator
//
//  Created by Nikita Govind on 2/1/18.
//  Copyright © 2018 Nikita Govind. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;


@end

