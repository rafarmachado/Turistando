//
//  MenuPrincipalViewController.h
//  Turistando
//
//  Created by Mac Mini on 10/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListarPaisesViewController.h"
#import "DownloadImageView.h"
#import "ModeloPerfil.h"
#import "Perfil.h"
#import "Funcionalidades.h"


@interface MenuPrincipalViewController : UIViewController

//Outlets
@property (strong, nonatomic) IBOutlet DownloadImageView *imagemPerfilFB;
@property (strong, nonatomic) IBOutlet UILabel *labelNomeFB;
@property (strong, nonatomic) IBOutlet UILabel *labelEmailFB;

//Actions
- (IBAction)btnListarPaises:(id)sender;
- (IBAction)btnListarFavoritos:(id)sender;




@end
