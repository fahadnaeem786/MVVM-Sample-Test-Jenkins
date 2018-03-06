//
//  ViewController.m
//  MVVM Sample
//
//  Created by Fahad Naeem on 2/7/18.
//  Copyright © 2018 Fahad Naeem. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


-(void)viewWillAppear:(BOOL)animated
{
    [self GetSavedTasks];
}


-(void)GetSavedTasks
{
    if (!_viewModel)
    {
        _viewModel = [[MainViewModel alloc] initWithRootViewController:self];
    }
    
    [_viewModel GetTasksFromAppStorage];
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_viewModel)
    {
       return _viewModel.tasksArr.count;
    }
    else
    {
        return 0;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    TaskModel * task = [_viewModel.tasksArr objectAtIndex:indexPath.row];
    
    cell.textLabel.text = task.titleStr;
    cell.detailTextLabel.text = task.descStr;
    
    if(task.status == [NSNumber numberWithBool:YES])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_viewModel StatusChangeofTask:indexPath.row];
}




- (IBAction)addPressed:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"Add_View" sender:self];
}


@end
