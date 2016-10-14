//
//  PaisesVisitadosViewController.h
//  Turistando
//
//  Created by Mac Mini on 11/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadImageView.h"
#import "Pais.h"
#import "ModeloPais.h"
#import "DetalhesPaisViewController.h"
#import "Funcionalidades.h"

@interface PaisesVisitadosViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UINavigationBarDelegate>{
    NSMutableArray *paisArrayFavoritos;
    NSArray *paisFavoritos;
}

//Outlets
@property (strong, nonatomic) IBOutlet UITableView *tabelaVistitados;
@property (strong, nonatomic) IBOutlet UILabel *labelNenhum;

@end
