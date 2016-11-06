//
//  main.m
//  SnakesAndLadders
//
//  Created by Suvan Ramani on 2016-11-05.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"Welcome to snakes and ladders!");
        
        InputHandler *inputHandler = [[InputHandler alloc] init];
        
        Player *playerOne = [[Player alloc] initWithName:@"Suvan"];
        
        while (playerOne.gameOn) {
            
            NSString *userInput = [inputHandler inputWithPrompt:@"Type 'r' or 'roll' to roll the dice"];
            
            if ([userInput isEqualToString:@"roll"] || [userInput isEqualToString:@"r"]) {
                [playerOne roll];
            }
            
        }
        
        NSLog(@"Congratulations! You win!");
        
        
    }
    return 0;
}
