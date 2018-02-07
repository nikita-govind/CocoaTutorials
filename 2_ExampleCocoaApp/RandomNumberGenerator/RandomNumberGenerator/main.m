//
//  main.m
//  RandomNumberGenerator
//
//  Created by Nikita Govind on 2/1/18.
//  Copyright © 2018 Nikita Govind. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[])
{
    NSLog(@"NIKITA: App is starting");
    return NSApplicationMain(argc, argv);

    /*
    1. Process is started
    main.m: int main
    
    2. Calls method NSApplicationMain, a startup function. This starts a runloop.
    Creates an instance of class NSApplication (which it knows bec the Principal class in Info.plist is NSApplication),
    should be called just once from main.m and on main thread
     It reads the NIB file in Info.plist: Main nib Base file (here it is MainMenu.xib) -> unarchives the objects in it
    
    3. Objects inside MainMenu.xib are created (random order)
    Each object's classes are alloced, instances are inited, instance variables are set (connections)
    We could have controller classes like RandomController that inherits from NSObject. These are instantiated too.
    
    **  There will always be only 1 AppDelegate for the App.
        The AppDelegate inherits from NSApplication.
        - The AppDelegate object Delegate's instance window is connected to outlet Window.
        - The AppDelegate object Delegate's instance delegate is connected to File's owner.
     
        The MainMenu.xib
        - File's owner class is NSApplication
        - File's owner delegate is connected to the AppDelegate object Delegate
     
    4. Every object in the NIB file is sent message:awakeFromNIB
    awakeFromNib for all objects (RandomController, AppDelegate)
        
    5. AppDelegate.m:applicationDidFinishLaunching is called
    We are ready to listen to user events
     
    // MainEventLoop starts:
    // The NSApplication object waits for an User event.
    
     
     
     ----------------------------      |                    |
     Mouse click/Keyboard input   -->  |  Windows Server    | --> WS puts the event on the event queue -> NSApplication object picks up from the queue -> forwards to the UI object (button etc) -> my class RandomController actionmethod is triggered ->
           (EVENT)                     |                    |
     ----------------------------      |                    |
                                       |                    |

     
     -> If your code changes the data in a view, the view is redisplayed -> again the NSApplication object picks up the next event from the queue and the loop continues
     
     ///////////////
     If at all we want to load a second NIB file
     -> Add new file - Application - MainMenu2.xib
     -> Add new file - Cocoa App - subclass of NSWindowController - WindowController2
     This created WindowController2.h and .m
     
     In IB for MainMenu2.xib
     - Add a button
     - Add an object. Change its class to WindowController2
     ///////////////
     
     6. App terminates: User chooses Quit from the menu, NSApp is sent the terminate: message.
     if CoreData: applicationShouldTerminate
     then AppDelegate.m:applicationWillTerminate
     
     */
    
}
