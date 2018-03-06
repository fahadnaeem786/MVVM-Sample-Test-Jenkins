//
//  MainViewModel.m
//  MVVM Sample
//
//  Created by Fahad Naeem on 2/8/18.
//  Copyright © 2018 Fahad Naeem. All rights reserved.
//

#import "MainViewModel.h"
#import "ViewController.h"


@implementation MainViewModel


- (id) initWithRootViewController:(ViewController*)rootViewController
{
    self = [MainViewModel new];
    
    if (self)
    {
        _rootView = rootViewController;
        
        _addtaskViewModel = [[AddNewTaskViewModel alloc]init];
        
        _tasksArr = [[NSMutableArray alloc]init];
    }
    
    return self;
}



-(void)GetTasksFromAppStorage
{
    _tasksArr = [[NSMutableArray alloc]initWithArray:[_addtaskViewModel GetOldSavedTasks]];
    
    [_rootView.tbl reloadData];
}





-(void)StatusChangeofTask:(NSInteger)index
{
    TaskModel * task = [_tasksArr objectAtIndex:index];
    
    if (task.status == [NSNumber numberWithBool:YES])
    {
        task.status = [NSNumber numberWithBool:NO];
    }
    else
    {
        task.status = [NSNumber numberWithBool:YES];
    }
    
    [_tasksArr replaceObjectAtIndex:index withObject:task];
    
    if([_addtaskViewModel SaveNewTaskInDB:_tasksArr] == true)
    {
        [self GetTasksFromAppStorage];
    }
}


@end
