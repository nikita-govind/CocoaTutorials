//
//  AppDelegate.h
//  SpeechToTextConverter
//
//  Created by WhatsOn TheMainThread on 2/4/18.
//  Copyright © 2018 WhatsOnTheMainThread. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSSpeechSynthesizerDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property (weak) IBOutlet NSTextField *inputText;

@property ()  NSSpeechSynthesizer *speechSynth;

@property (weak) IBOutlet NSButton *speakButton;
@property (weak) IBOutlet NSButton *stopButton;

@property () NSArray *voices;
@property (weak) IBOutlet NSTableView *tableViewList;

- (IBAction)stopIt:(id)sender;
- (IBAction)startIt:(id)sender;

@end

