//
//  GameController.m
//  Threelow
//
//  Created by Anthony Coelho on 2016-05-04.
//  Copyright © 2016 Vectura. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

-(instancetype)init{
    self = [super init];
    if (self) {
        

        
        
        NSMutableArray *setOfDice = [[NSMutableArray alloc] init];
        NSMutableSet *heldSetOfDice = [[NSMutableSet alloc] init];
        
        //create 5 dice and add to setOfDice
        int i;
        for (i=0; i < 5; i++){
            
            Dice *dice = [[Dice alloc] init];
            
            [setOfDice addObject: dice];
            
            
        }
        
        _setOfDice = setOfDice;
        _heldSetOfDice = heldSetOfDice;
    }
    return self;
}


-(void)holdDie:(int)diceIndex{
    
    
    if ([self.heldSetOfDice containsObject:self.setOfDice[diceIndex]]) {
        [self.heldSetOfDice removeObject:[self.setOfDice objectAtIndex:diceIndex]];
        
    }
    else{
        [self.heldSetOfDice addObject:[self.setOfDice objectAtIndex:diceIndex]];
    }
}

-(void)showFaceValue{
    self.outputString = [[NSMutableString alloc] init];

    for (Dice* dice in self.setOfDice){
        if  ([self.heldSetOfDice containsObject:dice]){
            self.outputString = [[self.outputString stringByAppendingString:[NSString stringWithFormat:@"[%@] - %d ",dice.possibleRolls[dice.currentValue-1], dice.currentValue  ]] mutableCopy];

        }
        else {
            self.outputString = [[self.outputString stringByAppendingString:[NSString stringWithFormat:@"%@ - %d ",dice.possibleRolls[dice.currentValue-1], dice.currentValue  ]] mutableCopy];


        }
    }
    
    NSLog(@"%@",self.outputString);
    self.numberOfRollsLeft = (int)self.setOfDice - (int)self.heldSetOfDice.count;
    
    [self showScore];
    

}

-(void)showScore{
    
    int total = 0;
    for (Dice* dice in self.setOfDice){
        if (dice.currentValue ==3) {
            total +=0;
        }
        else{
            total +=dice.currentValue;
        }
    }
    
    NSLog(@"You're score is : %d",total);
    
}

@end
