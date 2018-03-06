//
//  ViewController.h
//  MVVM Sample
//
//  Created by Fahad Naeem on 2/7/18.
//  Copyright © 2018 Fahad Naeem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewModel.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    
}

@property (weak, nonatomic) IBOutlet UITableView *tbl;

@property (strong, nonatomic) MainViewModel *viewModel;


- (IBAction)addPressed:(UIButton *)sender;


@end

