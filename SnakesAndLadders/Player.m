//
//  Player.m
//  SnakesAndLadders
//
//  Created by Suvan Ramani on 2016-11-05.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "Player.h"

@implementation Player


-(instancetype)initWithName:(NSString *)name {
    self = [super init];
    
    if (self) {
        _name = name;
        _currentSquare = 0;
        _gameLogic = [NSDictionary dictionaryWithObjectsAndKeys:
                       @14, @4, // ladder
                       @31, @9, // ladder
                       @84, @28, // ladder
                       @88, @40, // ladder
                       @67, @51, // ladder
                       @81, @63, // ladder
                       @7, @17, // snake
                       @60, @64, // snake
                       @26, @89, // snake
                       @78, @99, // snake
                      @75, @95, // snake
                      nil];
        
        _gameOn = YES;
        
    }
    return self;
}

-(void)roll {
    
    int lowerBound = 1;
    int upperBound = 6;
    
    // generate random number for dice roll
    int diceValue = lowerBound + arc4random() % (upperBound - lowerBound);
    
    
    
    // update current square with roll value
    self.currentSquare = [NSNumber numberWithInt:([self.currentSquare intValue] + diceValue)];
    
    NSLog(@"You rolled a: %d", diceValue);
    
    // DEAL WITH SNAKES AND LADDERS
    if ([self.gameLogic objectForKey:self.currentSquare]) {
        
        if ([self.currentSquare integerValue] < [[self.gameLogic objectForKey:self.currentSquare] integerValue]) {
            
            int newSquare = [[self.gameLogic objectForKey:self.currentSquare] intValue];
            self.currentSquare = [NSNumber numberWithInt:newSquare];
            
            NSLog(@"Stairway to heaven! Jump to square %d", newSquare);
            
        } else {
            int newSquare = [[self.gameLogic objectForKey:self.currentSquare] intValue];
            self.currentSquare = [NSNumber numberWithInt:newSquare];
            
            NSLog(@"You landed on a snake! Go back to square %d",newSquare);
        }
        
    } else {
        int newSquare = [self.currentSquare intValue];
        
        NSLog(@"You landed on square %d", newSquare);
    }
    
    // end game check
    
    if ([self.currentSquare intValue] >= 100) {
        self.gameOn = NO;
    }
}

@end
