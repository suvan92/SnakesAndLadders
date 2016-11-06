//
//  Player.h
//  SnakesAndLadders
//
//  Created by Suvan Ramani on 2016-11-05.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSNumber *currentSquare;
@property (nonatomic, strong) NSDictionary *gameLogic;
@property (nonatomic) BOOL gameOn;

-(instancetype)initWithName:(NSString *)name;
-(void)roll;

@end
