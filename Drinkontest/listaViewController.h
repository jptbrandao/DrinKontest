//
//  listaViewController.h
//  Drinkontest
//
//  Created by Joao Pedro Brandao on 1/27/15.
//  Copyright (c) 2015 João Pedro Masset Lacombe Dias Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface listaViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *ranking;
@end
