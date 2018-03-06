//
//  TaskModel.h
//  MVVM Sample
//
//  Created by Fahad Naeem on 2/8/18.
//  Copyright © 2018 Fahad Naeem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskModel : NSObject

@property (strong , nonatomic) NSString * titleStr;
@property (strong , nonatomic) NSString * descStr;
@property (strong , nonatomic) NSNumber * status;

-(TaskModel*)initWithNewTask:(NSString *)title andDesc:(NSString *)desc;

- (void)encodeWithCoder:(NSCoder *)encoder;
- (id)initWithCoder:(NSCoder *)decoder;

@end
