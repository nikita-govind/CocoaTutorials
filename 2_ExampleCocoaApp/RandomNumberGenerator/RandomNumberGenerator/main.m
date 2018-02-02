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
    // Process is started -> runs method NSApplicationMAin -> Creates an instance of class NSApplication
    // This NSApplication object reads the NIB file -> unarchives the objects in it -> classes are alloced, instances are inited -> instance variables are set (connections)
    // Every object in the NIB file is sent message:awakeFromNIB
    
    // MainEventLoop starts:
    // The NSApplication object waits for an User event.
    /*
     
     
     ----------------------------      |                    |
     Mouse click/Keyboard input   -->  |  Windows Server    | --> WS puts the event on the event queue -> NSApplication object picks up from the queue -> forwards to the UI object (button etc) -> my class RandomController actionmethod is triggered ->
           (EVENT)                     |                    |
     ----------------------------      |                    |
                                       |                    |

     
     -> If your code changes the data in a view, the view is redisplayed -> again the NSApplication object picks up the next event from the queue and the loop continues
     
     User chooses Quit from the menu, NSApp is sent the terminate: message.
     
     
     */
    
}
