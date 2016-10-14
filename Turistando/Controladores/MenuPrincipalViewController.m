//
//  MenuPrincipalViewController.m
//  Turistando
//
//  Created by Mac Mini on 10/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//

#import "MenuPrincipalViewController.h"

@interface MenuPrincipalViewController ()

@end

@implementation MenuPrincipalViewController

@synthesize imagemPerfilFB, labelNomeFB, labelEmailFB;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //Seta os dados do navigation controller
    self.navigationItem.title = @"Perfil";
    [self.navigationItem setHidesBackButton:YES];
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];

    //Cria um botão personalizado para o menu
    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [button setImage:[UIImage imageNamed:@"bt_menu.png"] forState:UIControlStateNormal];
    [button setTintColor:[UIColor blueColor]];
    [button addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleLeftMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [SlideNavigationController sharedInstance].leftBarButtonItem = leftBarButtonItem;

    //Define background da view
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    
    //Array que trás os dados do usuario do banco e preenche nas labels e na foto
    NSArray *arrayPerfil = [[NSArray alloc]init];
    arrayPerfil =  [[ModeloPerfil modeloCompartilhado] itens];
    //Seta infomações(nome e email) do Facebook
    for(Perfil *elemento in arrayPerfil){
        labelNomeFB.text = elemento.nome;
        labelEmailFB.text = elemento.email;
        UIImage *image = [UIImage imageWithData: elemento.foto];
        imagemPerfilFB.image =image;
        
        break;
        
    }

    self.imagemPerfilFB.layer.cornerRadius = 10.0f;
    self.imagemPerfilFB.clipsToBounds = YES;
    self.imagemPerfilFB.layer.borderWidth = 2.0f;
    self.imagemPerfilFB.layer.borderColor = [UIColor blueColor].CGColor;
}

//-(void)viewDidAppear:(BOOL)animated{
//    
//    [super viewDidAppear:YES];
//
//    self.navigationItem.title = @"Perfil";
//    [self.navigationItem setHidesBackButton:YES];
//    
//    [[self navigationController] setNavigationBarHidden:NO animated:YES];
//    
//    // Cria um Botao Customizado para o menu.
//    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    [button setImage:[UIImage imageNamed:@"bt_menu.png"] forState:UIControlStateNormal];
//    [button addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleLeftMenu) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//    [SlideNavigationController sharedInstance].leftBarButtonItem = leftBarButtonItem;
//    
//    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
//    
//    NSArray *arrayPerfil = [[NSArray alloc]init];
//    arrayPerfil =  [[ModeloPerfil modeloCompartilhado] itens];
//    //Seta infomações(nome e email) do Facebook
//    for(Perfil *elemento in arrayPerfil){
//        labelNomeFB.text = elemento.nome;
//        labelEmailFB.text = elemento.email;
//        UIImage *image = [UIImage imageWithData: elemento.foto];
//        imagemPerfilFB.image =image;
//        
//        break;
//    }
//    
//}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
        NSArray *arrayPerfil = [[NSArray alloc]init];
        arrayPerfil =  [[ModeloPerfil modeloCompartilhado] itens];
        //Seta infomações(nome e email) do Facebook
        for(Perfil *elemento in arrayPerfil){
            labelNomeFB.text = elemento.nome;
            labelEmailFB.text = elemento.email;
            UIImage *image = [UIImage imageWithData: elemento.foto];
            imagemPerfilFB.image =image;
        }
}


- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnListarPaises:(id)sender {
//    ListarPaisesViewController *detalhes = [self.storyboard instantiateViewControllerWithIdentifier:@"ListarPaisesViewController"];
//    [self presentViewController:detalhes animated:NO completion:nil];
    
}

- (IBAction)btnListarFavoritos:(id)sender {
}
@end
