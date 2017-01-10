//
//  ViewController.m
//  AsyncTask
//
//  Created by Zhongxi on 2017/1/10.
//  Copyright © 2017年 zhongxi. All rights reserved.
//

#import "ViewController.h"
#import "AsyncTask.h"
@interface ViewController()
@property (weak) IBOutlet NSTextField *launchTextField;
@property (weak) IBOutlet NSTextField *argumentTextField;
@property (weak) IBOutlet NSTextView *outStringTextView;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.outStringTextView.textColor = [NSColor colorWithCalibratedRed:0.169 green:0.631 blue:0.267 alpha:1.00];
}

- (IBAction)launchAction:(id)sender {
    if (self.launchTextField.stringValue.length == 0 || self.argumentTextField.stringValue.length == 0) {
        [self showAlert];
        return;
    }
    self.outStringTextView.string = @"";
    __weak typeof(self) weakSelf = self;
    /* /sbin/ping */
    /* github.com */
    NSArray * arguments = [self.argumentTextField.stringValue componentsSeparatedByString:@" "];
    if (arguments.count == 0) {
        arguments = @[@[self.argumentTextField.stringValue]];
    }
    [AsyncTask launchPath:self.launchTextField.stringValue currentDirectoryPath:nil arguments:arguments outputBlock:^(NSString *outString) {
        weakSelf.outStringTextView.string =  [weakSelf.outStringTextView.string stringByAppendingString:outString];
    } errBlock:^(NSString *errString) {
        weakSelf.outStringTextView.string =  [weakSelf.outStringTextView.string stringByAppendingString:errString];
    } onLaunch:^{
    } onExit:^{
    }];
}

-(void)showAlert{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSAlert * alert = [[NSAlert alloc]init];
        [alert setMessageText:@"warning"];
        [alert addButtonWithTitle:@"ok"];
        [alert setInformativeText:@"please fill out \"launch\" and \"arguments\""];
        [alert setAlertStyle:NSAlertStyleCritical];
        [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow completionHandler:^(NSModalResponse returnCode) {
        }];
    });
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
