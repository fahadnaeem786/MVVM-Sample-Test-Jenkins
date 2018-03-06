//
//  AddNewTaskViewModel.h
//  MVVM Sample
//
//  Created by Fahad Naeem on 2/8/18.
//  Copyright © 2018 Fahad Naeem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskModel.h"

@class AddNewTaskViewController;

@interface AddNewTaskViewModel : NSObject

@property (strong , nonatomic) AddNewTaskViewController * rootView;


- (id) initWithRootViewController:(AddNewTaskViewController*)rootViewController;

-(BOOL)SaveNewTask:(NSString *)title andDesc:(NSString *)Desc;

-(NSMutableArray *)GetOldSavedTasks;
-(BOOL)SaveNewTaskInDB:(NSMutableArray *)oldTasks;

@end
