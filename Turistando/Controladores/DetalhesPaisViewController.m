//
//  DetalhesPaisViewController.m
//  Turistando
//
//  Created by Mac Mini on 11/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//

#import "DetalhesPaisViewController.h"

@interface DetalhesPaisViewController ()

@end

@implementation DetalhesPaisViewController
@synthesize nomeCompleto, nomeShort, imgBandeira, codigoArea, scrollDetalhes, txtData, selecionarData, switchDetalhes, arrayPaisDetalhes, paisDetalhes, viewData;
BOOL validaCampos;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //Seta imagem de background da view
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    // Do any additional setup after loading the view.
    [viewData setHidden:YES];
    
    //Seta as infomações
    self.navigationItem.title = paisDetalhes.shortname;
    
    //Seta as informações nas label
    nomeCompleto.text = paisDetalhes.longname;
    imgBandeira.url = paisDetalhes.bandeira;
    codigoArea.text = [NSString stringWithFormat:@"Código de área: %@", paisDetalhes.callingCode];
    txtData.text = paisDetalhes.date;
    
    if([paisDetalhes.visitado isEqualToString:@"true"]){
        [switchDetalhes setOn:YES];
    }
    //Inicializa Scroll
    [self.scrollDetalhes setScrollEnabled:YES];
    self.scrollDetalhes.contentSize =CGSizeMake(0, 400);
    
    self.selecionarData.maximumDate = [NSDate date];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)btnConfirmar:(id)sender {
    if([self validaCamposObrigatorios]){
        [Funcionalidades startProgressSalvar:self.view];
        
        for(Pais *elemento in arrayPaisDetalhes){
            
            if([paisDetalhes.idPais isEqualToString:elemento.idPais]){
                [elemento setDate:txtData.text];
                [elemento setVisitado:@"true"];
                [[ModeloPais modeloCompartilhado] salvarMudancas];
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OK!"
                                                                message:@"Registro efetuado com sucesso"
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
                
                //Volta para a tela anterior depois de selecionar ok
                if(self.navigationController){
                    [self.navigationController popViewControllerAnimated:YES];
                }else{
                    [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
                }
                break;
            }
        }
    }
    [Funcionalidades stopProgressBar:self.view];
}


- (IBAction)btnCancelar:(id)sender {
    [viewData setHidden:YES];
}

- (IBAction)btnSelecionar:(id)sender {
    dataAtual =[selecionarData date];
    [viewData setHidden:YES];
    
    //converte date para string e seta no textField
    [txtData setText:[Funcionalidades converteDataLocalString:dataAtual]];
}

/*Método para validar se os campos e o switch estão preenchidos
 *Rafael Rezende Machado (rafael.rezendem@hotmail.com)
*/
-(BOOL) validaCamposObrigatorios {
    
    NSMutableString *camposObrigatorios = [[NSMutableString alloc] initWithString:@""];
    BOOL validaCampos = YES;
    
    if(![switchDetalhes isOn]) {
        [camposObrigatorios
         appendString:@"Marque o país como visitado!\n"];
        validaCampos = NO;
    }
    
    if([txtData.text length] ==0 ) {
        [camposObrigatorios
         appendString:@"Informe a data da visita!\n"];
        validaCampos = NO;
    }
    if(!validaCampos){
        [Funcionalidades Alerta:@"Atenção" msg:camposObrigatorios];
    }
    return  validaCampos;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [viewData setHidden:NO];
    [self.view endEditing:YES];
}

@end
