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
    
//    int lowerBound = 1;
//    int upperBound = 6;
//    
//    // generate random number for dice roll
//    int diceValue = lowerBound + arc4random() % (upperBound - lowerBound);
    
    int diceValue = 4;
    
    // update current square with roll value
    self.currentSquare = [NSNumber numberWithInt:([self.currentSquare intValue] + diceValue)];
    
    // deal with snakes and ladders
    
    for (NSNumber *specialSquare in self.gameLogic) {
        if ([self.currentSquare integerValue] == [specialSquare integerValue]) {
            
            self.currentSquare = [self.gameLogic objectForKey:specialSquare];
            
            if ([specialSquare integerValue] < [[self.gameLogic objectForKey:specialSquare] integerValue]) {
                NSLog(@"\n%@ rolled a %d\nStairway to heaven! You jumped to square %ld!", self.name, diceValue, (long) self.currentSquare);
            } else {
                NSLog(@"\n%@ rolled a %d\nYou landed on a snake! Go back to square %ld!", self.name, diceValue, (long) self.currentSquare);
            }
            break;
        } else {
            
            NSLog(@"\n%@ rolled a %d and is now on square %ld", self.name, diceValue,(long) self.currentSquare);
            break;
        }
        
    }
    
    // end game check
    
    if ([self.currentSquare intValue] >= 100) {
        self.gameOn = NO;
    }
}

@end
