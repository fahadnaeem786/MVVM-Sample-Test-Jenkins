//
//  AddNewTaskViewController.m
//  MVVM Sample
//
//  Created by Fahad Naeem on 2/8/18.
//  Copyright © 2018 Fahad Naeem. All rights reserved.
//

#import "AddNewTaskViewController.h"

@interface AddNewTaskViewController ()

@end

@implementation AddNewTaskViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (!_viewModel)
    {
        _viewModel = [[AddNewTaskViewModel alloc] initWithRootViewController:self];
    }
}



- (IBAction)addPressed:(UIButton *)sender
{
    if([_viewModel SaveNewTask:_txtTitle.text andDesc:_txtViewDesc.text] == true)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


@end
