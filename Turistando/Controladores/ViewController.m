//
//  ViewController.m
//  Turistando
//
//  Created by Mac Mini on 10/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//


#import "ViewController.h"

@interface ViewController (){
    NSManagedObjectContext *context;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Seta imagem de background da view
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    
    //Seta os dados do navigation controller
    [self.navigationController setNavigationBarHidden:YES animated:YES];

    
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    context = [delegate managedObjectContext];
    
    //Verifica se está conectado a internet, se não, despara um alerta avisando o usuario
    if(![self verificaConexao]){
        [Funcionalidades Alerta:@"Atenção" msg:@"Verifique sua conexão com a internet!"];
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 *Método que faz login com facebook e faz o request dos dados do usuario
 *@Rafael Rezende Machado (rafael.rezendem@hotmail.com)
*/
-(void)loginFacebook{
    
    [Funcionalidades startProgressCarregar:self.view];
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:@"/me"
                                  parameters:@{ @"fields": @"name,email, picture",}
                                  HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        if(result)
            
        {
            Perfil *perfil = [[ModeloPerfil  modeloCompartilhado] criarItem];
            if ([result objectForKey:@"id"]) {
                [perfil setIdFB:[result objectForKey:@"id"]];
                
            }
            if ([result objectForKey:@"email"]) {
                [perfil setNome:[result objectForKey:@"email"]];
                
            }
            if ([result objectForKey:@"name"]) {
                [perfil setEmail:[result objectForKey:@"name"]];
                
            }
            if ([result objectForKey:@"picture"]) {
                
                NSDictionary *dictionary = (NSDictionary *)result;
                NSDictionary *data = [dictionary objectForKey:@"picture"];
                NSDictionary *picture = [data objectForKey:@"data"];
                NSString *photoUrl = (NSString *)[picture objectForKey:@"url"];
                NSURL *imageURL = [NSURL URLWithString:photoUrl];
                NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                [perfil setFoto:imageData];
                
            }
            
            [[ModeloPerfil modeloCompartilhado] salvarMudancas];
            [Funcionalidades stopProgressBar:self.view];

        }
    }];
    
}

/*
 *Botão personalizado que chama o login com facebook e verifica se obteve sucesso, se não, emite um alerta para o usuario
 *@Rafael Rezende Machado (rafael.rezendem@hotmail.com)
 */
- (IBAction)botaoLogarFB:(id)sender {
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    //Set Permissões
    [login logInWithReadPermissions:@[@"email", @"public_profile"] fromViewController:nil handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error)
        {
            //Em caso de erro exibe Alert
            [Funcionalidades Alerta:@"Erro!" msg:@"Problemas ao conectar ao Facebook!"];
            [Funcionalidades stopProgressBar:self.view];

        }
        else
        {
            if(result.token)
            {
                // Token Facebook criado com sucesso, pronto para pegar infos do perfil
                [self loginFacebook];
                
                NSString *main = @"Main";
                UIStoryboard *instanciaStoryboard = [UIStoryboard storyboardWithName:main bundle: nil];
                MenuPrincipalViewController * vc = [instanciaStoryboard instantiateViewControllerWithIdentifier:@"MenuPrincipalViewController"];
                    
                [[self navigationController] pushViewController:vc animated:YES];
                
            
            }
        }
    }];
    
}

/*
 *Método nativo que verifica conexão com a internet
 *@Rafael Rezende Machado (rafael.rezendem@hotmail.com)
 */
- (BOOL)verificaConexao{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    BOOL connected;
    BOOL isConnected;
    const char *host = "www.apple.com";
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, host);
    SCNetworkReachabilityFlags flags;
    connected = SCNetworkReachabilityGetFlags(reachability, &flags);
    isConnected = NO;
    isConnected = connected && (flags & kSCNetworkFlagsReachable) && !(flags & kSCNetworkFlagsConnectionRequired);
    CFRelease(reachability);
    return isConnected;
}
@end
