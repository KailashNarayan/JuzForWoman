//
//  JFWAddPostViewController.h
//  JUZ4Women
//
//  Created by Kailash on 5/3/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFWAddPostViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewObj;

@property (weak, nonatomic) IBOutlet UITextView *textViewObj;

@property (weak, nonatomic) IBOutlet UIImageView *textViewBackgroundImageView;

@property (weak, nonatomic) IBOutlet UITextField *titleTextFieldObj;

@property (weak, nonatomic) IBOutlet UITextField *tag1TextFieldObj;

@property (weak, nonatomic) IBOutlet UITextField *tag2TextFieldObj;

@property (weak, nonatomic) IBOutlet UITextField *tag3TextFieldObj;


@end
