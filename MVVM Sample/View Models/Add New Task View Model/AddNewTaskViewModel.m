//
//  AddNewTaskViewModel.m
//  MVVM Sample
//
//  Created by Fahad Naeem on 2/8/18.
//  Copyright © 2018 Fahad Naeem. All rights reserved.
//

#import "AddNewTaskViewModel.h"
#import "AddNewTaskViewController.h"


@implementation AddNewTaskViewModel


- (id) initWithRootViewController:(AddNewTaskViewController*)rootViewController
{
    self = [AddNewTaskViewModel new];
    
    if (self)
    {
        _rootView = rootViewController;
    }
    
    return self;
}




-(BOOL)SaveNewTask:(NSString *)title andDesc:(NSString *)Desc
{
    TaskModel * newTask = [[TaskModel alloc]initWithNewTask:title andDesc:Desc];
    
    NSMutableArray * oldTasks = [[NSMutableArray alloc]initWithArray:[self GetOldSavedTasks]];

    [oldTasks addObject:newTask];

    if([self SaveNewTaskInDB:oldTasks])
    {
        return  true;
    }
    else
    {
        return false;
    }
}





-(NSMutableArray *)GetOldSavedTasks
{
    NSData *encodedObjects = [[NSUserDefaults standardUserDefaults] objectForKey:@"TASKS"];
    
    return [NSKeyedUnarchiver unarchiveObjectWithData:encodedObjects];
}




-(BOOL)SaveNewTaskInDB:(NSMutableArray *)oldTasks
{
    NSData *encodedObjects = [NSKeyedArchiver archivedDataWithRootObject:oldTasks];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObjects forKey:@"TASKS"];
    BOOL isdone = [defaults synchronize];
    
    return isdone;
}


@end
