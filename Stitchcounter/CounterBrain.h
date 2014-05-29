//  HEADER
//  CounterBrain.h
//  Stitchcounter
//
//  Created by Jennifer Louie on 3/19/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CounterBrain : NSObject
@property double rowsToDo;
@property double rowsCompleted;
@property double totalRows;

//designated initializer
-(CounterBrain *)initWithTotalRows:(NSString *)totalRows;

-(void)resetCounter;

-(double)calculateRowsToDo;

@end
