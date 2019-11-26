#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
@private int counter;
@private UILabel *lbInfo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    counter = 0;
    
    UIButton *btnAction = [UIButton new];
    [btnAction setTitle:@"Action" forState:UIControlStateNormal];
    [btnAction setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btnAction.frame = CGRectMake(20, 100, UIScreen.mainScreen.bounds.size.width - 40, 50);
    [btnAction addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAction];
    
    lbInfo = [UILabel new];
    lbInfo.text = @"0";
    lbInfo.textAlignment = NSTextAlignmentCenter;
    lbInfo.frame = CGRectMake(20, 200, UIScreen.mainScreen.bounds.size.width - 40, 50);
    [self.view addSubview:lbInfo];
    
    
    btnAction.accessibilityIdentifier = @"btn_action";
    lbInfo.accessibilityIdentifier = @"lb_info";
}

-(void)btnAction{
    NSLog(@"btnAction");
    counter++;
    lbInfo.text = [NSString stringWithFormat:@"%d", counter];
}

@end

