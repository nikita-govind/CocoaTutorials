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
    
    2. Calls method NSApplicationMain, a startup function
    Creates an instance of class NSApplication, should be called just once from main.m and on main thread
    This NSApplication object reads the NIB file -> unarchives the objects in it
    
    3. Objects are created
    Each object's classes are alloced, instances are inited, instance variables are set (connections)
    
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
     
     6. App terminates: User chooses Quit from the menu, NSApp is sent the terminate: message.
     if CoreData: applicationShouldTerminate
     then AppDelegate.m:applicationWillTerminate
     
     */
    
}
