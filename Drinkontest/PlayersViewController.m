//
//  PlayersViewController.m
//  Drinkontest
//
//  Created by João Pedro Masset Lacombe Dias Garcia on 1/24/15.
//  Copyright (c) 2015 João Pedro Masset Lacombe Dias Garcia. All rights reserved.
//

#import "PlayersViewController.h"

@interface PlayersViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numeroDeJogadores;
@property NSUserDefaults *defaultsDeJogadores;
@end

@implementation PlayersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.defaultsDeJogadores=[NSUserDefaults standardUserDefaults];
    self.numeroDeJogadores.text = [[NSString alloc] initWithFormat:@"%d",2];
    [_defaultsDeJogadores setObject:[NSString stringWithFormat: @"%@",self.numeroDeJogadores.text] forKey:@"numJogadores"];
    [_defaultsDeJogadores synchronize];
    
    
    // Do any additional setup after loading the view.
}
- (IBAction)mais:(id)sender {
    int num = [self.numeroDeJogadores.text intValue];
    if(num<6){
        num++;
        self.numeroDeJogadores.text = [[NSString alloc] initWithFormat:@"%ld",(long)num];
        [_defaultsDeJogadores setObject:[NSString stringWithFormat: @"%@",self.numeroDeJogadores.text] forKey:@"numJogadores"];
        [_defaultsDeJogadores synchronize];
    }
}
- (IBAction)menos:(id)sender {
    int num = [self.numeroDeJogadores.text intValue];
    if(num>2){
        num--;
        self.numeroDeJogadores.text = [[NSString alloc] initWithFormat:@"%ld",(long)num];
        [_defaultsDeJogadores setObject:[NSString stringWithFormat: @"%@",self.numeroDeJogadores.text] forKey:@"numJogadores"];
        [_defaultsDeJogadores synchronize];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
