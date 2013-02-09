//
//  MTViewController.m
//  MrT
//
//  Created by Foster Lockwood on 2/9/13.
//  Copyright (c) 2013 Apps in House. All rights reserved.
//

#import "MTViewController.h"
#import <AVFoundation/AVFoundation.h>

enum kButtonTag {
    kButtonOne,
    kButtonTwo,
    kButtonThree,
    kButtonFour,
    kButtonFive,
    kButtonSix,
};

@interface MTViewController ()

@property (strong) AVAudioPlayer* player;

@end

@implementation MTViewController

- (IBAction)soundButtonPressed:(UIButton*)sender {
    [self.player stop];
    NSString* path = nil;
    if (sender.tag == kButtonOne) {
        path = [[NSBundle mainBundle] pathForResource:@"hardworkin" ofType:@"mp3"];
    } else if (sender.tag == kButtonTwo) {
        path = [[NSBundle mainBundle] pathForResource:@"indian" ofType:@"mp3"];
    } else if (sender.tag == kButtonThree) {
        path = [[NSBundle mainBundle] pathForResource:@"shot_van" ofType:@"mp3"];
    } else if (sender.tag == kButtonFour) {
        path = [[NSBundle mainBundle] pathForResource:@"smoothoveryou" ofType:@"mp3"];
    } else if (sender.tag == kButtonFive) {
        path = [[NSBundle mainBundle] pathForResource:@"staycool" ofType:@"mp3"];
    } else if (sender.tag == kButtonSix) {
        path = [[NSBundle mainBundle] pathForResource:@"trademark" ofType:@"mp3"];
    }
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
    [self.player play];
}

- (IBAction)infoButtonPressed:(UIButton*)sender {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"About"
                                                    message:@"This is version 1.0 of the Mr. T Soundboard. This App was created by Foster Lockwood for COMP150-ISW at Tufts University."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)lolButtonPressed:(UIButton*)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.youtube.com/watch?v=7_rBidCkJxo"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
