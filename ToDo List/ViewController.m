//
//  ViewController.m
//  ToDo List
//
//  Created by Андрей Ремизов on 07.02.16.
//  Copyright © 2016 GB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UIButton *buttonSave;

// - (IBAction)buttonAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.buttonSave addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) save {

    NSLog(@"save");

}


//- (IBAction)buttonAction:(id)sender {

 //   NSLog(@"Button Action");


//}
@end
