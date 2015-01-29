//
//  listaViewController.m
//  Drinkontest
//
//  Created by Joao Pedro Brandao on 1/27/15.
//  Copyright (c) 2015 João Pedro Masset Lacombe Dias Garcia. All rights reserved.
//

#import "listaViewController.h"
@interface listaViewController ()
@property NSUserDefaults *defaultsDeJogadores;

@end
@implementation listaViewController
{
    NSMutableArray *tableData;
    NSArray *place;
}

int numJog;
int posicao[6];
int jogadores[6];

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.ranking.delegate = self;
//    self.ranking.dataSource = self;
    tableData = [NSMutableArray arrayWithObjects:@"Azul",@"Vermelho",@"Verde",@"Amarelo",@"Roxo",@"Laranja", nil];
    place = [NSArray arrayWithObjects:@"1st", @"2nd", @"3rd", @"4th", @"5th", @"6th", nil];
    
    _defaultsDeJogadores= [NSUserDefaults standardUserDefaults];
    NSString *stringNumJog = [_defaultsDeJogadores stringForKey:@"numJogadores"];
    
    numJog = [ stringNumJog intValue ];
    NSLog(@"numero %d",numJog);
    

    for(int i=0;i<numJog;i++){
        NSString *stringPosicao = [_defaultsDeJogadores stringForKey:[NSString stringWithFormat:@"key%d",i]];
        posicao[i] = [ stringPosicao intValue ];
        jogadores[i] = i;
    
        NSLog(@"posicao jogador %d: %d",i,posicao[i]);
    }
    
    [self bubblesort];
    
    
    
    //NSIndexPath *index = [NSIndexPath indexPathForItem:0 inSection:0];
    //[self.ranking beginUpdates];
  // [self.ranking insertRowsAtIndexPaths:@[index] withRowAnimation:<#(UITableViewRowAnimation)#>]
    // Do any additional setup after loading the view.
}

-(void) bubblesort
{
    int i ;
    bool swapped = TRUE;
    while (swapped)
    {
        swapped = false;
        for( i = 1; i < numJog ; i++ )
        {
            if(posicao[i-1] < posicao[i])
            {
                int temp = posicao[i-1];
                posicao[i-1] = posicao[i];
                posicao[i] = temp;
                
                [tableData exchangeObjectAtIndex:(i-1) withObjectAtIndex:i];
                
                temp = jogadores[i-1];
                jogadores[i-1] = jogadores[i];
                jogadores[i] = temp;
                swapped = true;
            }
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return numJog;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableid = @"Ranking";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableid];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableid];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", [place objectAtIndex:indexPath.row], [tableData objectAtIndex:indexPath.row]];
    return cell;
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
