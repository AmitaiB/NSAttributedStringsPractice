//
//  ViewController.m
//  NSAttributedStringsPractice
//
//  Created by Amitai Blickstein on 9/20/15.
//  Copyright © 2015 Amitai Blickstein, LLC. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+FlatUI.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"The Republic by Plato"];
    
    NSRange rangeOfTitle = [attributedString.string rangeOfString:@"The Republic"];
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor alizarinColor] range:rangeOfTitle];
    
    UIFont *font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:self.stringLabel.font.pointSize];
    
    NSRange rangeOfAuthor = [attributedString.string rangeOfString:@"Plato"];
    
    [attributedString addAttribute:NSFontAttributeName value:font range:rangeOfAuthor];
    
    
    
    self.stringLabel.attributedText = attributedString;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    
    return YES;
}

@end
