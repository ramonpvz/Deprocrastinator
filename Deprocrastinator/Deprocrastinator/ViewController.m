//
//  ViewController.m
//  Deprocrastinator
//
//  Created by GLBMXM0002 on 10/6/14.
//  Copyright (c) 2014 asda. All rights reserved.
//

#import "ViewController.h"
#import "MyRow.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtField;
@property NSMutableArray *items;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = [[NSMutableArray alloc] init];
}

- (IBAction)onAddButtonPressed:(id)sender {

    NSLog(@"Text: %@", [self.txtField text]);
    MyRow *_row = [[MyRow alloc] init];
    _row.txtValue = [self.txtField text];
    
    [self.items addObject:_row];
    NSLog(@"%@", self.items);
    [self.myTableView reloadData];

}

- (NSInteger)tableView: (UITableView * )tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"colorCellId"
                             forIndexPath:indexPath];

    if ([self.items count] > 0) {
        MyRow *_row = [self.items objectAtIndex: indexPath.row];
        cell.textLabel.text = [_row txtValue];
        
        if (_row.isSelected)
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
    }

    return cell;
    
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    MyRow *_row = [self.items objectAtIndex:indexPath.row];
    _row.isSelected = !_row.isSelected;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
