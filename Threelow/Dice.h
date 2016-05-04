//
//  Dice.h
//  Threelow
//
//  Created by Anthony Coelho on 2016-05-04.
//  Copyright © 2016 Vectura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property int currentValue;
@property (strong, nonatomic) NSArray *possibleRolls;

-(void)randomize;
-(void)roll;




@end
