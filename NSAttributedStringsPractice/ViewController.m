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
    self.stringLabel.attributedText = attributedString;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:textField.text];

    NSRegularExpression *titleRegex = [NSRegularExpression regularExpressionWithPattern:@"(.*)(?=:)|(.*)(?= by)" options:NSRegularExpressionCaseInsensitive error:nil];
    NSRange rangeOfTitle = [titleRegex rangeOfFirstMatchInString:textField.text options:NSMatchingReportCompletion range:NSRangeFromString(textField.text)];
    
    NSRegularExpression *subtitleRegex = [NSRegularExpression regularExpressionWithPattern:@"(?<=: )(.*)(?= by)" options:NSRegularExpressionCaseInsensitive error:nil];
    NSRange rangeOfSubtitle = [subtitleRegex rangeOfFirstMatchInString:textField.text options:NSMatchingReportCompletion range:NSMakeRange(0, textField.text.length)];
    
    
    NSRegularExpression *bylineRegex = [NSRegularExpression regularExpressionWithPattern:@"(?<= by )(.*)(?=\\\\()" options:NSRegularExpressionCaseInsensitive error:nil];
    NSRange rangeOfByline = [bylineRegex rangeOfFirstMatchInString:textField.text options:0 range:NSRangeFromString(textField.text)];
    
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor peterRiverColor] range:rangeOfTitle];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Impact" size:18.0f] range:[textField.text rangeOfString:textField.text]];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor carrotColor] range:rangeOfByline];
    
    
//    self.stringLabel.text = nil;
    self.stringLabel.attributedText = [attributedString copy];
    
    return YES;
}

@end
