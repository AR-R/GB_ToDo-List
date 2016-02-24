//
//  ViewController.m
//  ToDo List
//
//  Created by Андрей Ремизов on 07.02.16.
//  Copyright © 2016 GB. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UIButton *buttonSave;

// - (IBAction)buttonAction:(id)sender;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Put a defence for user to be avoiding wrong actions as result of uncorrect process of programm
    
    self.buttonSave.userInteractionEnabled = NO;
    
    // To set minimum Date
    
    self.datePicker.minimumDate = [NSDate date];
    
    // To obey datePicker to be implemented datePickerValueChanged
    
    [self.datePicker addTarget:self action:@selector(datePickerValueChanged) forControlEvents:
     
    UIControlEventValueChanged];
    
    // To obey buttonSave to be implemented save
    
    [self.buttonSave addTarget:self action:@selector(save) forControlEvents:
     
     UIControlEventTouchUpInside];
    
    UITapGestureRecognizer * handleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:
    @selector (handleEndEditing)];
    
    [self.view addGestureRecognizer:handleTap];
   
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (void) handleEndEditing {

    if ([self.textField.text length] != 0) {
        
        [self.view endEditing:YES];
        
        self.buttonSave.userInteractionEnabled = YES;
        
        
    }
    
    else {
        
       [self showAlertWithMessage:@" To save event, place characters to text field"];
        
        
   }

   
    
    
    
    // [self.textField resignFirstResponder];

}

- (void) datePickerValueChanged {

    self.eventDate = self.datePicker.date;
    
    NSLog(@"self.eventDate %@", self.eventDate);


}

- (void) showAlertWithMessage: (NSString *) message {
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Attention!" message: message
                                                    delegate: self cancelButtonTitle: @"OK" otherButtonTitles: nil, nil];
    
    [alert show];
    
    
}


- (void) save {
    
    if (self.eventDate) {
        
        if ([self.eventDate compare:[NSDate date]] == NSOrderedSame) {
            
            [self showAlertWithMessage: @"Future's date can't be equal to current date"];
        
        }
        
        else  if ([self.eventDate compare:[NSDate date]] == NSOrderedAscending) {
                
                [self showAlertWithMessage:@" Future's date can't be early than current date"];
                
            }

            else {
        
        [self setNotification];
    
           
    //   [self showAlertWithMessage:@" To save event, replace Date for more latest"];
        
    }

    
    }
    
    
    
}

- (void) setNotification {
    // Prepare notification for user to be presented the blocked screen
    
    // Create the information which translated for our table structure
    
    // Create object of NSString
    
    // Value of object is equal to value of textField
    
    NSString * eventInfo = self.textField.text;
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    
    formatter.dateFormat = @"HH:mm dd:MMMM.yyyy";
    
    // Assign NSString to our eventDate
    
    NSString * eventDate = [formatter stringFromDate:self.eventDate];
    
    // To be manage our data correctly appealing to collection NSDictionary with Value/key attached
    
    NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:eventInfo, @"eventInfo",
                           eventDate, @"eventDate", nil];
    
    // Create some notification (object of class UILocalNotification
    
    UILocalNotification * notification = [[UILocalNotification alloc] init];
    
    // Appoint value to it's properties
    
    // first property: userInfo is equal to dict
    
    notification.userInfo = dict;
    
    notification.timeZone = [NSTimeZone defaultTimeZone];
    
    // it's required fireDate when the notification to be listened and equal to eventDate (datePicker)
    
    notification.fireDate = self.eventDate;
    
    // some property: alertBody text in notification for screen has blocked
    // and included in the text field eventInfo
    
    notification.alertBody = eventInfo;
    
    // it's defined with the red icon if message has not read yet
    
    notification.applicationIconBadgeNumber = 1;
    
    // name of some sound to be occured for every received messages
    
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    // Created notification has required to list of our mobil appendix
    
    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
    
    // NSLog(@"save");



}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    if ([textField isEqual:self.textField]) {
        
        if ([self.textField.text length] != 0) {
            
            [self.textField resignFirstResponder];
            
            self.buttonSave.userInteractionEnabled = YES;
            
            return YES;
        }
      
       else {
            
           [self showAlertWithMessage:@" To save event, place characters to text field"];
            
    }

        
        }
    
    
        return NO;
    
        }
    
    

             // called when 'return' key pressed. return NO to ignore.

// It's important to inform a user abour his wrong actions would be commiting




//- (IBAction)buttonAction:(id)sender {

 //   NSLog(@"Button Action");


// }

@end
