//
//  DetalhesPaisViewController.h
//  Turistando
//
//  Created by Mac Mini on 11/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadImageView.h"
#import "Pais.h"
#import "Funcionalidades.h"
#import "ModeloPais.h"
#import "ListarPaisesViewController.h"

@interface DetalhesPaisViewController : UIViewController<UIAlertViewDelegate>{
        NSDate *dataAtual;
        int  validaData;
}

//Outlets
@property (weak, nonatomic)  Pais *paisDetalhes;
@property (weak, nonatomic)  NSArray *arrayPaisDetalhes;
@property (strong, nonatomic) IBOutlet UILabel *nomeShort;
@property (strong, nonatomic) IBOutlet DownloadImageView *imgBandeira;
@property (strong, nonatomic) IBOutlet UILabel *nomeCompleto;
@property (strong, nonatomic) IBOutlet UILabel *codigoArea;
@property (strong, nonatomic) IBOutlet UITextField *txtData;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollDetalhes;
@property (strong, nonatomic) IBOutlet UIView *viewData;
@property (strong, nonatomic) IBOutlet UIDatePicker *selecionarData;
@property (strong, nonatomic) IBOutlet UISwitch *switchDetalhes;

//Actions
- (IBAction)btnConfirmar:(id)sender;
- (IBAction)btnCancelar:(id)sender;
- (IBAction)btnSelecionar:(id)sender;

@end
