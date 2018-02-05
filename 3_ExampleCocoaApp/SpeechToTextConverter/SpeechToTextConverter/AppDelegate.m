//
//  AppDelegate.m
//  SpeechToTextConverter
//
//  Created by WhatsOn TheMainThread on 2/4/18.
//  Copyright © 2018 WhatsOnTheMainThread. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
- (IBAction)saveAction:(id)sender;

@end

@implementation AppDelegate

@synthesize persistentContainer = _persistentContainer;
@synthesize inputText;
@synthesize speechSynth;
@synthesize speakButton;
@synthesize stopButton;
@synthesize voices;
@synthesize tableViewList;

- (id) init
{
    self = [super init];
    
    if (self)
    {
        NSLog(@"NIKITA: Delegate class AppDelegate object is inited, speechSynth delegat eis inited, voices array has been populated");
        
        // Create a new instance of NSSpeechSynthesizer
        // with the default voice.
        speechSynth = [[NSSpeechSynthesizer alloc]
                        initWithVoice:nil];
        
        // Init the delegate
        [speechSynth setDelegate:self];
        
        // init the voices array
        voices =  [NSSpeechSynthesizer availableVoices];
    }
    
    return self;
}

- (IBAction)startIt:(id)sender {
    NSString *inputString = [inputText stringValue];
    NSLog(@"NIKITA: startIt method called: this is the string - %s", [inputString UTF8String]);
    
    // Is it 0 length?
    if (![inputString length])
    {
        NSLog(@"NIKITA: 0 length string inputted. do nothing.");
        return;
    }
    
    [speechSynth startSpeakingString:inputString];
    NSLog(@"NIKITA: Have started to say: %@. Speak button disabled, stop button enabled, tableViewlist is disabled", inputString);
    
    [stopButton setEnabled:YES];
    [speakButton setEnabled:NO];
    [tableViewList setEnabled:NO];
    
    return;
}

- (IBAction)stopIt:(id)sender {
    NSLog(@"NIKITA: stopIt method called, tableViewList is enabled");
    [speechSynth stopSpeaking];
    [tableViewList setEnabled:YES];
}

// SpeechSynth Delegate method
- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender
        didFinishSpeaking:(BOOL)finishedSpeaking
{
    
    NSLog(@"finishedSpeaking = %d. speakButton re-enabled, stop button disabled", finishedSpeaking);
    [stopButton setEnabled:NO];
    [speakButton setEnabled:YES];
    [tableViewList setEnabled:YES];
}

// Data source methods for TableView helper
// How many rows?
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv
{
    return (NSInteger)[voices count];
}

// What is the syting in row x?
- (id)tableView:(NSTableView *)tv
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    NSString *v = [voices objectAtIndex:row];
    return v;
}

//T ableView delegate method
- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSInteger row = [tableViewList selectedRow];
    if (row == 1600) { // should be -1
        return;
    }
    NSString *selectedVoice = [voices objectAtIndex:row];
    [speechSynth setVoice:selectedVoice];
    NSLog(@"new voice = %@", selectedVoice);
}

- (void) awakeFromNib
{
    // When the table view appears on screen, the default voice
    // should be selected
    NSString *defaultVoice = [NSSpeechSynthesizer defaultVoice];
    NSInteger defaultRow = [voices indexOfObject:defaultVoice];
    NSIndexSet *indices = [NSIndexSet indexSetWithIndex:defaultRow];
    [tableViewList selectRowIndexes:indices byExtendingSelection:NO];
    [tableViewList scrollRowToVisible:defaultRow];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    NSString *methodName = NSStringFromSelector(aSelector);
    NSLog(@"respondsToSelector:%@", methodName);
    return [super respondsToSelector:aSelector];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


#pragma mark - Core Data stack

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"SpeechToTextConverter"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving and Undo support

- (IBAction)saveAction:(id)sender {
    // Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
    NSManagedObjectContext *context = self.persistentContainer.viewContext;

    if (![context commitEditing]) {
        NSLog(@"%@:%@ unable to commit editing before saving", [self class], NSStringFromSelector(_cmd));
    }
    
    NSError *error = nil;
    if (context.hasChanges && ![context save:&error]) {
        // Customize this code block to include application-specific recovery steps.              
        [[NSApplication sharedApplication] presentError:error];
    }
}

- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window {
    // Returns the NSUndoManager for the application. In this case, the manager returned is that of the managed object context for the application.
    return self.persistentContainer.viewContext.undoManager;
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender {
    
    NSLog(@"NIKITA: Application terminated");
    // Save changes in the application's managed object context before the application terminates.
    NSManagedObjectContext *context = self.persistentContainer.viewContext;

    if (![context commitEditing]) {
        NSLog(@"%@:%@ unable to commit editing to terminate", [self class], NSStringFromSelector(_cmd));
        return NSTerminateCancel;
    }
    
    if (!context.hasChanges) {
        return NSTerminateNow;
    }
    
    NSError *error = nil;
    if (![context save:&error]) {

        // Customize this code block to include application-specific recovery steps.
        BOOL result = [sender presentError:error];
        if (result) {
            return NSTerminateCancel;
        }

        NSString *question = NSLocalizedString(@"Could not save changes while quitting. Quit anyway?", @"Quit without saves error question message");
        NSString *info = NSLocalizedString(@"Quitting now will lose any changes you have made since the last successful save", @"Quit without saves error question info");
        NSString *quitButton = NSLocalizedString(@"Quit anyway", @"Quit anyway button title");
        NSString *cancelButton = NSLocalizedString(@"Cancel", @"Cancel button title");
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:question];
        [alert setInformativeText:info];
        [alert addButtonWithTitle:quitButton];
        [alert addButtonWithTitle:cancelButton];

        NSInteger answer = [alert runModal];
        
        if (answer == NSAlertSecondButtonReturn) {
            return NSTerminateCancel;
        }
    }

    return NSTerminateNow;
}

@end
