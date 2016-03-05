//
//  ViewController.h
//  ToDo List
//
//  Created by Андрей Ремизов on 07.02.16.
//  Copyright © 2016 GB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, strong) NSDate * eventDate;

@property (nonatomic, strong) NSString * eventInfo;

@property (nonatomic, assign) BOOL isDetail;

@end

