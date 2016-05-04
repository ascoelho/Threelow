//
//  Dice.m
//  Threelow
//
//  Created by Anthony Coelho on 2016-05-04.
//  Copyright © 2016 Vectura. All rights reserved.
//

#import "Dice.h"

@implementation Dice

-(instancetype)init{
    self = [super init];
    
    _possibleRolls = [[NSArray alloc] initWithObjects:@"\u2680",@"\u2681",@"\u2682",@"\u2683",@"\u2684",@"\u2685", nil];
    
   
    
    return self;
    
}

-(void)randomize{

    
    self.currentValue = arc4random_uniform(6) + 1;
}

-(void)roll{
    
    [self randomize];
    
    
}







@end
