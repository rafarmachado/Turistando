//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"

@implementation LeftMenuViewController
@synthesize imagemPerfilFbMenu;
#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.slideOutAnimationEnabled = YES;
    
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor lightGrayColor];
    
    //	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bakgroundMenu.jpg"]];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    id <SlideNavigationContorllerAnimator> revealAnimator;
    CGFloat animationDuration = 0;
    
    revealAnimator = [[SlideNavigationContorllerAnimatorFade alloc] init];
    animationDuration = .18;
    
    [[SlideNavigationController sharedInstance] closeMenuWithCompletion:^{
        [SlideNavigationController sharedInstance].menuRevealAnimationDuration = animationDuration;
        [SlideNavigationController sharedInstance].menuRevealAnimator = revealAnimator;
    }];
    
    NSArray *arrayPerfil = [[NSArray alloc]init];
    arrayPerfil =  [[ModeloPerfil modeloCompartilhado] itens];
    //Seta infomações(nome e email) do Facebook
    for(Perfil *elemento in arrayPerfil){
        UIImage *image = [UIImage imageWithData: elemento.foto];
        imagemPerfilFbMenu.image =image;
        
        break;
        
    }
    
    self.imagemPerfilFbMenu.layer.cornerRadius = self.imagemPerfilFbMenu.frame.size.width / 2;
    self.imagemPerfilFbMenu.clipsToBounds = YES;
    self.imagemPerfilFbMenu.layer.borderWidth = 2.0f;
    self.imagemPerfilFbMenu.layer.borderColor = [UIColor whiteColor].CGColor;
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MenuEsquerdoViewCell = @"MenuEsquerdoViewCell";
    
    MenuLateralEsquerdoViewCell *cell = (MenuLateralEsquerdoViewCell *)[tableView dequeueReusableCellWithIdentifier:MenuEsquerdoViewCell];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MenuLateralEsquerdoViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    switch (indexPath.row)
    {
        case 0:{
            cell.txtItensMenu.text = @"Perfil";
            
            [cell.imgIconeMenu setImage:[UIImage imageNamed:@"user-black.png"]];
            break;
        }
            
        case 1:{
            cell.txtItensMenu.text = @"Listar Países";
            
            [cell.imgIconeMenu setImage:[UIImage imageNamed:@"earth-black.png"]];
            break;}
            
        case 2:{
            cell.txtItensMenu.text = @"Países Favoritos";
            
            [cell.imgIconeMenu setImage:[UIImage imageNamed:@"international-delivery-black.png"]];
            break;}
            
        case 3:{
            cell.txtItensMenu.text = @"Sair";
            
            [cell.imgIconeMenu setImage:[UIImage imageNamed:@"ic_exit_to_app_36pt.png"]];
            break;}
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UIViewController *vc ;
    
    switch (indexPath.row)
    {
        case 0:
            vc = [self.storyboard instantiateViewControllerWithIdentifier: @"MenuPrincipalViewController"];
            break;
            
        case 1:
            vc = [self.storyboard  instantiateViewControllerWithIdentifier: @"ListarPaisesViewController"];
            break;
            
        case 2:
            vc = [self.storyboard  instantiateViewControllerWithIdentifier: @"PaisesVisitadosViewController"];
            break;
            
        case 3:{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Deseja realmente sair?"
                                                            message:@""
                                                           delegate:self
                                                  cancelButtonTitle:@"Não"
                                                  otherButtonTitles:@"Sim", nil];
            [alert show];
            
            break;
        }
    }
    
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                     andCompletion:nil];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch(buttonIndex) {
        case 0: //"No" pressed
            //do something?
            break;
        case 1: //"Yes" pressed
            exit(0);
            break;
    }
}


@end
