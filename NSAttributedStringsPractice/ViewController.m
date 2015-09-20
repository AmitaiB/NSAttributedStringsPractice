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
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.stringLabel.attributedText = [self configureBookInfoString:textField.text];
    
    return YES;
}

-(NSAttributedString*)configureBookInfoString:(NSString*)infoString {
    if (![infoString containsString:@"by"]) {
        return [[NSAttributedString alloc] initWithString:infoString];
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:infoString];
    
    NSRange rangeOfBy = [attributedString.string rangeOfString:@"by"];
    NSRange rangeOfTitle = NSMakeRange(0, rangeOfBy.location);
    NSUInteger lengthOfAuthorName = attributedString.length - NSMaxRange(rangeOfBy);
    NSRange rangeOfAuthor = NSMakeRange(NSMaxRange(rangeOfBy), lengthOfAuthorName);
    
    UIFont *font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:self.stringLabel.font.pointSize];
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor alizarinColor] range:rangeOfTitle];
    [attributedString addAttribute:NSFontAttributeName value:font range:rangeOfAuthor];
    
    return attributedString;
}

@end
