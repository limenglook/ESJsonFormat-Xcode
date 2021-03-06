//
//  ESSettingController.m
//  ESJsonFormat
//
//  Created by 尹桥印 on 15/7/19.
//  Copyright (c) 2015年 EnjoySR. All rights reserved.
//

#import "ESSettingController.h"
#import "ESJsonFormatSetting.h"

@interface ESSettingController ()
@property (weak) IBOutlet NSButton *btnImpMJExtesion;
@property (weak) IBOutlet NSButton *btnGeneric;
@property (weak) IBOutlet NSButton *btnOutputToFile;
@property (weak) IBOutlet NSButton *btnPropertyPosition;

@end

@implementation ESSettingController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    
    self.btnImpMJExtesion.state = (NSCellStateValue)[[ESJsonFormatSetting defaultSetting] impOjbClassInArray];
    self.btnGeneric.state = (NSCellStateValue)[[ESJsonFormatSetting defaultSetting] useGeneric];
    self.btnOutputToFile.state = (NSCellStateValue)[[ESJsonFormatSetting defaultSetting] outputToFiles];
    self.btnPropertyPosition.state = (NSCellStateValue)[[ESJsonFormatSetting defaultSetting] propertyPosition];
    
    if (![ESUtils isXcode7AndLater]) {
        self.btnGeneric.enabled = NO;
    }
    
    [self updateSettingState];
}

- (IBAction)btnImpMtdForMJClick:(NSButton *)sender {
    [[ESJsonFormatSetting defaultSetting] setImpOjbClassInArray:sender.state];
}

- (IBAction)btnUseGenericClick:(NSButton *)sender {
    [[ESJsonFormatSetting defaultSetting] setUseGeneric:sender.state];
}

- (IBAction)btnOutputToFilesClick:(NSButton *)sender {
    [[ESJsonFormatSetting defaultSetting] setOutputToFiles:sender.state];
}

- (IBAction)btnUpercaseKeyWordForIdClick:(NSButton *)sender {
    [[ESJsonFormatSetting defaultSetting] setUppercaseKeyWordForId:sender.state];
}

- (IBAction)btnPropertyPosition:(NSButton *)sender {
    [[ESJsonFormatSetting defaultSetting] setPropertyPosition:sender.state];
    [self updateSettingState];
}

- (IBAction)tapGes:(NSClickGestureRecognizer *)sender {
    NSURL* url = [[ NSURL alloc ] initWithString :@"http://t.cn/RLarUfg"];
    [[NSWorkspace sharedWorkspace] openURL:url];
}

- (void)updateSettingState
{
    self.btnPropertyPosition.title = self.btnPropertyPosition.state ?  @"@property (%@, nonatomic)" : @"@property (nonatomic, %@)";
}

@end
