//
//  HotLimeViewController.m
//  textApp
//
//  Created by SARA on 9/20/16.
//  Copyright © 2016 provenlogic. All rights reserved.
//

#import "HotLimeViewController.h"
#import "HotlineSDK/Hotline.h"

@interface HotLimeViewController ()


@property (strong, nonatomic) IBOutlet UIButton *faqBtn;
@property (strong, nonatomic) IBOutlet UIButton *conBtn;

@end

@implementation HotLimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.faqBtn.layer.cornerRadius = 10;
    self.faqBtn.layer.borderWidth = 1;
    self.faqBtn.layer.borderColor=[UIColor grayColor].CGColor;
    self.faqBtn.clipsToBounds = YES;
    
    self.conBtn.layer.cornerRadius = 10;
    self.conBtn.layer.borderWidth = 1;
    self.conBtn.layer.borderColor=[UIColor grayColor].CGColor;
    self.conBtn.clipsToBounds = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissHotlineVC:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)openFaq:(id)sender {
    [[Hotline sharedInstance] showFAQs:self];
}

- (IBAction)openConversations:(id)sender {
 [[Hotline sharedInstance] showConversations:self];
}
@end
