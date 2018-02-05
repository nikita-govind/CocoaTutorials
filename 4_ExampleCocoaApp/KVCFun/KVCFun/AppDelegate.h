//
//  AppDelegate.h
//  KVCFun
//
//  Created by WhatsOn TheMainThread on 2/4/18.
//  Copyright © 2018 WhatsOnTheMainThread. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readwrite, assign) int fido;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (int)fido;
- (void)setFido:(int)x;

- (IBAction)incrementFido:(id)sender;

@end

