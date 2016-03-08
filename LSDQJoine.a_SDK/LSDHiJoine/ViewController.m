//
//  ViewController.m
//  LSDHiJoine
//
//  Created by lsd on 15/4/7.
//  Copyright (c) 2015年 LSD_SUBU(DCN(传宁)). All rights reserved.
//

#import "ViewController.h"
//#import <QJoineLib/HiJoine.h>
#import "HiJoine.h"
#import "SVProgressHUD.h"

#define Global(block)                   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define Main(block)                     dispatch_async(dispatch_get_main_queue(),block)

@interface ViewController ()<HiJoineDelegate>


@property (nonatomic, strong)HiJoine * joine;

@property (nonatomic, strong) IBOutlet UITextField * pwdTextField;
@property (nonatomic, strong) IBOutlet UILabel * SSIDLab;
@property (nonatomic, strong) IBOutlet UIButton * showBut;
//版本号
@property (weak, nonatomic) IBOutlet UILabel *verisionLabel;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property (nonatomic, weak) NSTimer *timer;

@end

static long  _times = 0;

@implementation ViewController
- (void)setSsidTitle:(NSString *)ssidTitle
{
    _ssidTitle = ssidTitle;
    self.SSIDLab.text = ssidTitle;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    [self.sendBtn setTitle:@"正在发送……" forState:UIControlStateDisabled];
    [self.showBut setImage:[UIImage imageNamed:@"show_press.png"] forState:UIControlStateSelected];
    [self.showBut setImage:[UIImage imageNamed:@"show"] forState:UIControlStateNormal];
    
    _joine = [[HiJoine alloc] init];
    NSDictionary  * dic  = [_joine fetchSSIDInfo];
    _joine.delegate = self;
    NSString * ssidStr = [dic objectForKey:@"SSID"];

    _SSIDLab.text = ssidStr;
    
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textFieldResponder)];
    [self.view addGestureRecognizer:tapGes];
    
    //获取版本号
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *versionStr =infoDict[@"CFBundleVersion"];
    self.verisionLabel.text = versionStr;
    
    //设置按钮的格式
    self.sendBtn.layer.cornerRadius = 10;
    self.sendBtn.layer.masksToBounds = YES;
}

-(void)textFieldResponder{
    [_pwdTextField resignFirstResponder];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.pwdTextField resignFirstResponder];
}
- (IBAction)sendData:(id)sender{
    UIButton *sendBtn = (UIButton *)sender;
    sendBtn.enabled = NO;
    _times = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(counteTime) userInfo:nil repeats:YES];
    [_timer fire];
    [SVProgressHUD show];
    HiJoine *joine = [[HiJoine alloc] init];
    [joine setBoardDataWithPassword:_pwdTextField.text withBackBlock:^(NSInteger result, NSString *message) {
        [SVProgressHUD dismiss];
        if (result == 1) {
            NSString *successStr = [NSString stringWithFormat:@"MAC地址 %@ 连接成功，耗时 %ld 秒", message, _times];
            [SVProgressHUD showSuccessWithStatus:successStr];
        }else{
            NSString *failStr = [NSString stringWithFormat:@"%@,耗时%ld 秒", message, _times];
            [SVProgressHUD showErrorWithStatus:failStr];
        }
        sendBtn.enabled = YES;
        [self endSending];
    }];
}

- (void)endSending
{
    [_timer invalidate];
    _timer = nil;
}

- (void)counteTime
{
    _times ++;
}

- (IBAction)showPWD:(id)sender{
    [_pwdTextField resignFirstResponder];
    if ( _pwdTextField.secureTextEntry==YES) {
        _pwdTextField.secureTextEntry = NO;
        self.showBut.selected = YES;
        
    }else{
        _pwdTextField.secureTextEntry = YES;
        self.showBut.selected = NO;
    }
}

/**
 *  HiJoine 的代理
 *
 *  @param sucess 返回的mac
 */
- (void)HiJoineWiFiSucceed:(NSString *)succeed{
//    NSLog(@"%@", succeed);
}

/**
 *  超时回调
 *
 */
- (void)HiJoineWiFiTimeOut{
//    NSLog(@"HiJoineWiFiTimeOut");
}

- (void)HiJoineWiFiError:(NSString *)error
{
//    NSLog(@"HiJoineWiFiError");
}
@end
