//
//  WindowController2.m
//  RandomNumberGenerator
//
//  Created by Nikita Govind on 2/6/18.
//  Copyright © 2018 Nikita Govind. All rights reserved.
//

#import "WindowController2.h"

@interface WindowController2 ()

@end

@implementation WindowController2

- (id)init
{
    if (self = [super initWithWindowNibName:@"MainMenu2" owner:self])
    {
        
    }

    NSLog(@"NIKITA: Alloc-initing WindowController2");
    return self; 
}

- (void)windowDidLoad {
    [super windowDidLoad]; // This initiates for NSWindowController
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
