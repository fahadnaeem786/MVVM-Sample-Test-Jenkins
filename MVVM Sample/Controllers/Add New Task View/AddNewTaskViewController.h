//
//  AddNewTaskViewController.h
//  MVVM Sample
//
//  Created by Fahad Naeem on 2/8/18.
//  Copyright © 2018 Fahad Naeem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNewTaskViewModel.h"


@interface AddNewTaskViewController : UIViewController

@property (strong, nonatomic) AddNewTaskViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UITextField *txtTitle;

@property (weak, nonatomic) IBOutlet UITextView *txtViewDesc;

- (IBAction)addPressed:(UIButton *)sender;

@end
