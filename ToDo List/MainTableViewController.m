//
//  MainTableViewController.m
//  ToDo List
//
//  Created by Андрей Ремизов on 25.02.16.
//  Copyright © 2016 GB. All rights reserved.
//

#import "MainTableViewController.h"
#import "DetailViewController.h"

@interface MainTableViewController ()

@property (nonatomic, strong) NSMutableArray * arrayEvents;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

// Such method has appeared when some windows must only reveal on the screen of the device

- (void)viewWillAppear:(BOOL)animated {

  //  self.arrayEvents = [[NSMutableArray alloc] initWithObjects:@"AAAA ", @"BBBB ", @"CCCC", nil];
    
    // Study how has created some events which became be notifications at table view some Iphone
    
    // Have created such event converted to be presented in table list of notifications
    
    NSArray * array = [[UIApplication sharedApplication] scheduledLocalNotifications];
    
    self.arrayEvents = [[NSMutableArray alloc] initWithArray:array];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


// Amount of cells reflecting the table presence has equal number of elements at some array

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayEvents.count;
}


 // Configure the every cell...

// Below some method which implementing the table Cells

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    // NSString is equal to our array's every elements that has happened without mistakes
    
    // NSString * string = [self.arrayEvents objectAtIndex:indexPath.row];
    
    UILocalNotification * notification = [self.arrayEvents objectAtIndex:indexPath.row];
    
    // Some text's cell would be equal to some string
    
    NSDictionary * dict = notification.userInfo;
    
    // self.textLabel.text = string;
    
    cell.textLabel.text = [dict objectForKey:@"eventInfo"];
    
    cell.detailTextLabel.text = [dict objectForKey:@"eventDate"];
    
    
    
   
    
    return cell;
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Created instance of Class
    
    DetailViewController * detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"detailView"];
    
    // After touch of cell and it's release existed an animated removal to another window
    
    [self.navigationController pushViewController:detailView animated:YES];
    
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


                                                                                              


@end


