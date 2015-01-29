//
//  FacilViewController.m
//  Drinkontest
//
//  Created by João Pedro Masset Lacombe Dias Garcia on 1/24/15.
//  Copyright (c) 2015 João Pedro Masset Lacombe Dias Garcia. All rights reserved.
//

#import "FacilViewController.h"

@interface FacilViewController (){
    NSArray *imgs[13];
    UIImageView *dot;
    UIButton *butt;
    NSArray *pl[6];
    NSArray *buttons[14];
    NSArray *jog[6];
    NSArray *dieImages;
}
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@property (weak, nonatomic) IBOutlet UIButton *b4;
@property (weak, nonatomic) IBOutlet UIButton *b5;
@property (weak, nonatomic) IBOutlet UIButton *b6;
@property (weak, nonatomic) IBOutlet UIButton *b7;
@property (weak, nonatomic) IBOutlet UIButton *b8;
@property (weak, nonatomic) IBOutlet UIButton *b9;
@property (weak, nonatomic) IBOutlet UIButton *b10;
@property (weak, nonatomic) IBOutlet UIButton *b11;
@property (weak, nonatomic) IBOutlet UIButton *b12;
@property (weak, nonatomic) IBOutlet UIButton *b13;
@property (weak, nonatomic) IBOutlet UIButton *dado;
@property (weak, nonatomic) IBOutlet UIImageView *end;


//players
@property (weak, nonatomic) IBOutlet UIImageView *player1;
@property (weak, nonatomic) IBOutlet UIImageView *player2;
@property (weak, nonatomic) IBOutlet UIImageView *player3;
@property (weak, nonatomic) IBOutlet UIImageView *player4;
@property (weak, nonatomic) IBOutlet UIImageView *player5;
@property (weak, nonatomic) IBOutlet UIImageView *player6;

//bolinhas para acender
@property (weak, nonatomic) IBOutlet UIImageView *jog1;
@property (weak, nonatomic) IBOutlet UIImageView *jog2;
@property (weak, nonatomic) IBOutlet UIImageView *jog3;
@property (weak, nonatomic) IBOutlet UIImageView *jog4;
@property (weak, nonatomic) IBOutlet UIImageView *jog5;
@property (weak, nonatomic) IBOutlet UIImageView *jog6;

//defaults
@property NSUserDefaults *defaultsDeJogadores;

@end

@implementation FacilViewController
NSString *stringNumJog;
int numJog;
int player = 0;
int player_pos[6];


- (void)viewDidLoad {
    [super viewDidLoad];
    
    dieImages = [NSArray arrayWithObjects: @"DADO1.png", @"DADO2.png", @"DADO3.png", @"DADO4.png", nil];

    
    player = 0;
    // get number of players
    _defaultsDeJogadores= [NSUserDefaults standardUserDefaults];
    stringNumJog = [_defaultsDeJogadores stringForKey:@"numJogadores"];
    
    numJog = [ stringNumJog intValue ];
    
    
    self.jog1.hidden=YES;
    self.jog2.hidden=YES;
    self.jog3.hidden=YES;
    self.jog4.hidden=YES;
    self.jog5.hidden=YES;
    self.jog6.hidden=YES;
    
    jog[0]=self.jog1;
    jog[1]=self.jog2;
    jog[2]=self.jog3;
    jog[3]=self.jog4;
    jog[4]=self.jog5;
    jog[5]=self.jog6;
    
    for(int i=0;i<numJog;i++){
        UIImageView *imagem=jog[i];
        imagem.hidden=NO;
        //imagem.opaque=0.5;
        imagem.alpha = 0.5;
    }
    UIImageView *imagem;
    imagem=jog[0];
    imagem.alpha = 1;

    self.end.hidden = YES;
    pl[0] = self.player1;
    pl[1] = self.player2;
    pl[2] = self.player3;
    pl[3] = self.player4;
    pl[4] = self.player5;
    pl[5] = self.player6;
    
    
    buttons[12] = self.b1;
    buttons[11] = self.b2;
    buttons[10] = self.b3;
    buttons[9] = self.b4;
    buttons[8] = self.b5;
    buttons[7] = self.b6;
    buttons[6] = self.b7;
    buttons[5] = self.b8;
    buttons[4] = self.b9;
    buttons[3] = self.b10;
    buttons[2] = self.b11;
    buttons[1] = self.b12;
    buttons[0] = self.b13;
    buttons[13] = self.end;

    
    int Casa[13];
    //////////////////////////////////////
    /// HASH FUNCTION PARA EMBARALHAR! ///
    //////////////////////////////////////
    for(int i = 0 ; i < 13 ; i++ )
    {
        //Casa[i] = Nil;
        Casa[i] = -1;
    }
    for(int i = 1 ; i <= 13 ; i++ )
    {
        int casa = arc4random()%13;
        //NSLog(@"CASA-random é: %d",casa);
        
        //if ( Casa[casa] == Nil )
        if( Casa[casa] == -1 )
        {
            Casa[casa] = i;
            //NSLog(@"%d entoru na %d", i, casa);
        }
        else{
            int o = casa;
            
            //while( Casa[o] != Nil )
            while( Casa[o] != -1 )
            {
                o++;
                if( o == 13 )
                {
                    o=0;
                }
            }
            if( Casa[o] == -1 )
            {
                Casa[o] = i;
                //NSLog(@"%d entoru na %d", i, o);
            }
        }
    }
    //////////   FIM DA HASH   ////////////
    
    //SETANDO AS IMAGENS NO TABULEIRO.
    for( int i = 0 ; i < 13 ; i++ )
    {
        imgs[i] = [NSString stringWithFormat:@"%d.png",Casa[i]];
        //NSLog(@"%@",imgs[i]);
    }
    
    [self.b1  setImage:[UIImage imageNamed:imgs[0] ] forState:UIControlStateNormal];
    [self.b2  setImage:[UIImage imageNamed:imgs[1] ] forState:UIControlStateNormal];
    [self.b3  setImage:[UIImage imageNamed:imgs[2] ] forState:UIControlStateNormal];
    [self.b4  setImage:[UIImage imageNamed:imgs[3] ] forState:UIControlStateNormal];
    [self.b5  setImage:[UIImage imageNamed:imgs[4] ] forState:UIControlStateNormal];
    [self.b6  setImage:[UIImage imageNamed:imgs[5] ] forState:UIControlStateNormal];
    [self.b7  setImage:[UIImage imageNamed:imgs[6] ] forState:UIControlStateNormal];
    [self.b8  setImage:[UIImage imageNamed:imgs[7] ] forState:UIControlStateNormal];
    [self.b9  setImage:[UIImage imageNamed:imgs[8] ] forState:UIControlStateNormal];
    [self.b10 setImage:[UIImage imageNamed:imgs[9] ] forState:UIControlStateNormal];
    [self.b11 setImage:[UIImage imageNamed:imgs[10]] forState:UIControlStateNormal];
    [self.b12 setImage:[UIImage imageNamed:imgs[11]] forState:UIControlStateNormal];
    [self.b13 setImage:[UIImage imageNamed:imgs[12]] forState:UIControlStateNormal];
    //[self.dado setImage:[UIImage imageNamed:[dieImages objectAtIndex:arc4random()%4]] forState:UIControlStateNormal];
    [self.dado setImage:[UIImage imageNamed:@"DADO3.png"] forState:UIControlStateNormal];
    
    //CRIA VIZUALIZACAO DA IMAGEM ESCONDIDA
    dot =[[UIImageView alloc] initWithFrame:CGRectMake(10, 10 , 300, 300)];
    dot.image=[UIImage imageNamed:imgs[0]];
    dot.backgroundColor=[UIColor whiteColor];
    [dot.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [dot.layer setBorderWidth:1.0];
    [self.view addSubview:dot];
    dot.hidden=YES;
    //CRIA VIZUALIZACAO DO BOTAO PARA APAGAR A IMAGEM
    CGRect buttFrame = CGRectMake(290, 290 , 30, 30);;
    butt = [[UIButton alloc] initWithFrame: buttFrame];
    [butt setImage:[UIImage imageNamed:@"Button Close.png"] forState:UIControlStateNormal];
    [butt addTarget:self
             action:@selector(fechar:)
   forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: butt];
    butt.hidden=YES;
    
 
    // ---  init players  ---
    // players position
    for (int i = 0 ; i < numJog ; i++ )
    {
        player_pos[i] = 0;
        UIImageView *img = pl[i];
        img.hidden = NO;
    }
    for (int i = numJog ; i < 6 ; i++)
    {
        UIImageView *img = pl[i];
        img.hidden = YES;
    }
    
    

    

}

- (IBAction)b1:(id)sender {
    dot.image=[UIImage imageNamed:imgs[0]];
    dot.hidden=NO;
    butt.hidden=NO;
}
- (IBAction)b2:(id)sender {
    dot.image=[UIImage imageNamed:imgs[1]];
    dot.hidden=NO;
    butt.hidden=NO;
}
- (IBAction)b3:(id)sender {
    dot.image=[UIImage imageNamed:imgs[2]];
    dot.hidden=NO;
    butt.hidden=NO;
}
- (IBAction)b4:(id)sender {
    dot.image=[UIImage imageNamed:imgs[3]];
    dot.hidden=NO;
    butt.hidden=NO;
}
- (IBAction)b5:(id)sender {
    dot.image=[UIImage imageNamed:imgs[4]];
    dot.hidden=NO;
    butt.hidden=NO;
}
- (IBAction)b6:(id)sender {
    dot.image=[UIImage imageNamed:imgs[5]];
    dot.hidden=NO;
    butt.hidden=NO;
}
- (IBAction)b7:(id)sender {
    dot.image=[UIImage imageNamed:imgs[6]];
    dot.hidden=NO;
    butt.hidden=NO;
}
- (IBAction)b8:(id)sender {
    dot.image=[UIImage imageNamed:imgs[7]];
    dot.hidden=NO;
    butt.hidden=NO;
}
- (IBAction)b9:(id)sender {
    dot.image=[UIImage imageNamed:imgs[8]];
    dot.hidden=NO;
    butt.hidden=NO;
}
- (IBAction)b10:(id)sender {
    dot.image=[UIImage imageNamed:imgs[9]];
    dot.hidden=NO;
    butt.hidden=NO;
}
- (IBAction)b11:(id)sender {
    dot.image=[UIImage imageNamed:imgs[10]];
    dot.hidden=NO;
    butt.hidden=NO;
}
- (IBAction)b12:(id)sender {
    dot.image=[UIImage imageNamed:imgs[11]];
    dot.hidden=NO;
    butt.hidden=NO;
}
- (IBAction)b13:(id)sender {
    dot.image=[UIImage imageNamed:imgs[12]];
    dot.hidden=NO;
    butt.hidden=NO;
}

int roll;
bool flag = false;
- (IBAction)roll_die:(id)sender {
    //fazer animacao
    
    flag = false;
    roll = arc4random()%4 + 1;
    
    player_pos[player] += roll;
    
    //mov = [[NSTimer alloc] init];
    mov = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(roll) userInfo:nil repeats:YES];
    
    if(player_pos[player] >= 14)
    {
        player_pos[player] = 14;
        flag = true;

        for(int i=0;i<numJog;i++){
            [self.defaultsDeJogadores setObject: [NSString stringWithFormat:@"%d",player_pos[i]+1] forKey:[NSString stringWithFormat:@"key%d",i]];
            [self.defaultsDeJogadores synchronize];
        }
        
        [self performSegueWithIdentifier:@"facilParaLista" sender:Nil];
    }
    
//    //fazer animacao passando o pino do jogado para posicao atual
//    UIImageView *img = pl[player];
//    UIButton *bt = buttons[player_pos[player] - 1];
//    [img setCenter:CGPointMake(bt.frame.origin.x + arc4random()%30, bt.frame.origin.y + arc4random()%30)];
//    
//    if ( flag )
//    {
//        // animacao de ganhar
//    }
//    else
//    {
//        UIImageView *imagem=jog[player];
//        imagem.alpha = 0.5;
//        // next player
//        player = (player+1)%numJog;
//        imagem=jog[player];
//        imagem.alpha = 1;
//    }
    
}

int i = 0;
NSTimer *mov;
-(void) roll
{
    NSString *nome = [NSString stringWithFormat:@"DADO%d.png", i%4 + 1];
    
    self.dado.imageView.image = [UIImage imageNamed:nome];
    i++;
    
    if( i == 8+roll)
    {
        //self.dado.imageView.image = [UIImage imageNamed:[dieImages objectAtIndex:roll-1]];
        [mov invalidate];
        mov = nil;
        i = 0;
        
        //fazer animacao passando o pino do jogado para posicao atual
        UIImageView *img = pl[player];
        UIButton *bt = buttons[player_pos[player] - 1];
        [img setCenter:CGPointMake(bt.frame.origin.x + arc4random()%30, bt.frame.origin.y + arc4random()%30)];
        
        if ( flag )
        {
            // animacao de ganhar
        }
        else
        {
            UIImageView *imagem=jog[player];
            imagem.alpha = 0.5;
            // next player
            player = (player+1)%numJog;
            imagem=jog[player];
            imagem.alpha = 1;
        }
    }
    
}


- (void)fechar:(UIButton*)button
{
    dot.hidden=YES;
    butt.hidden=YES;
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
