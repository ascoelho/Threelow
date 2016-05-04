//
//  main.m
//  Threelow
//
//  Created by Anthony Coelho on 2016-05-04.
//  Copyright © 2016 Vectura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

        
        GameController *gameController = [[GameController alloc] init];
        gameController.numberOfRollsLeft = 5;
        
        
        BOOL keepPlaying = YES;
        BOOL firstRoll = YES;

        while (keepPlaying && gameController.numberOfRollsLeft>0 ) {
     

            
                char choice[255];
                
                if (firstRoll == YES) {
                    printf("\nHi, welcome to Threelow\nPlease choose from the following options\nroll- Roll dice\nquit - End game\n");
                }
                else {
                printf("\nPlease choose from the following options\nroll- Roll dice\nhold - Hold dice\nreset - Reset all held dice\nquit - End game\n");
                }
                
                fgets(choice, 255, stdin);
                NSString *choiceString = [NSString stringWithFormat:@"%s",choice];
                choiceString = [choiceString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                
                if ([choiceString isEqualToString:@"roll"]) {
                    for (Dice *dice in gameController.setOfDice) {
                        
                        if (![gameController.heldSetOfDice containsObject:dice]) {
                            [dice randomize];
                        }
                        
                        
                    
                        
                    }

                    [gameController showFaceValue];

                    firstRoll = NO;
                    
                    
                    

                }
                else if ([choiceString isEqualToString:@"hold"]){
                    
                    BOOL decidingToHold = YES;
                    
                    while (decidingToHold) {
                        

                    printf("\nDice number to hold (done if done holding):");
                    fgets(choice, 255, stdin);
                    NSString *choiceString = [NSString stringWithFormat:@"%s",choice];
                    choiceString = [choiceString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                    
                        if ([choiceString isEqualToString:@"done"]){
                            
                            decidingToHold = NO;
 
                        }
                        else{
                            
                            [gameController holdDie:[choiceString intValue]-1];
                            [gameController showFaceValue];
                            
                        }
                  
                    


                    
                    }
                    

                    
                    
                }
                else if ([choiceString isEqualToString:@"reset"]){
                    
                    gameController.heldSetOfDice = nil;
                    [gameController showFaceValue];
                    
                  
                    
                }
                else if ([choiceString isEqualToString:@"quit"]){
                    keepPlaying = NO;
                    
                    
                }
                
           
                
                
        }
            
        NSLog(@"Thank you for playing");
        [gameController showScore];

        
    }
    return 0;
}
