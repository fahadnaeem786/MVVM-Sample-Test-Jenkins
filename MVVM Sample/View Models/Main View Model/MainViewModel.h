//
//  MainViewModel.h
//  MVVM Sample
//
//  Created by Fahad Naeem on 2/8/18.
//  Copyright © 2018 Fahad Naeem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskModel.h"
#import "AddNewTaskViewModel.h"

@class ViewController;

@interface MainViewModel : NSObject

@property (strong , nonatomic) ViewController * rootView;
@property (strong , nonatomic) AddNewTaskViewModel * addtaskViewModel;

@property (strong , nonatomic) NSMutableArray * tasksArr;

- (id) initWithRootViewController:(ViewController*)rootViewController;


-(void)GetTasksFromAppStorage;
-(void)StatusChangeofTask:(NSInteger)index;


@end
