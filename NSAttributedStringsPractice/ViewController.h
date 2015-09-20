//
//  ViewController.h
//  NSAttributedStringsPractice
//
//  Created by Amitai Blickstein on 9/20/15.
//  Copyright © 2015 Amitai Blickstein, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *stringLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

