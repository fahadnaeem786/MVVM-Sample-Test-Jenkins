//
//  TaskModel.m
//  MVVM Sample
//
//  Created by Fahad Naeem on 2/8/18.
//  Copyright © 2018 Fahad Naeem. All rights reserved.
//

#import "TaskModel.h"

@implementation TaskModel


-(TaskModel*)initWithNewTask:(NSString *)title andDesc:(NSString *)desc
{
    TaskModel * newtask = [TaskModel new];
    newtask.titleStr = title;
    newtask.descStr  = desc;
    newtask.status  = [NSNumber numberWithBool:NO];

    return newtask;
}






- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.titleStr forKey:@"titleStr"];
    [encoder encodeObject:self.descStr forKey:@"descStr"];
    [encoder encodeObject:self.status forKey:@"status"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super init]))
    {
        self.titleStr = [decoder decodeObjectForKey:@"titleStr"];
        self.descStr = [decoder decodeObjectForKey:@"descStr"];
        self.status = [decoder decodeObjectForKey:@"status"];
    }
    return self;
}


@end
