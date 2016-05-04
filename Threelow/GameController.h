//
//  GameController.h
//  Threelow
//
//  Created by Anthony Coelho on 2016-05-04.
//  Copyright © 2016 Vectura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property (strong, nonatomic) NSMutableArray *setOfDice;
@property (strong, nonatomic) NSMutableSet *heldSetOfDice;
@property (strong, nonatomic) NSMutableString *outputString;

@property int numberOfRollsLeft;

-(instancetype)init;
-(void)holdDie:(int)diceIndex;

-(void)showFaceValue;
-(void)showScore;

@end
