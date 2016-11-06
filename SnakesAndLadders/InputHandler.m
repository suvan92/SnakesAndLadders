//
//  InputHandler.m
//  SnakesAndLadders
//
//  Created by Suvan Ramani on 2016-11-05.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler


-(NSString *)inputWithPrompt:(NSString *)inputPrompt {
    
    NSLog(@"%@", inputPrompt);
    char inputCString[255];
    
    fgets(inputCString, 255, stdin);
    
    NSString *userInput = [NSString stringWithCString:inputCString encoding:NSUTF8StringEncoding];
    
    userInput = [userInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    userInput = [userInput lowercaseString];
    
    return userInput;
    
}

@end
