//
//  PaisesVisitadosViewController.m
//  Turistando
//
//  Created by Mac Mini on 11/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//

#import "PaisesVisitadosViewController.h"

@interface PaisesVisitadosViewController ()

@end

@implementation PaisesVisitadosViewController
@synthesize tabelaVistitados, labelNenhum;

UIBarButtonItem *editTableButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Seta imagem de background da view
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    
    [self atualizaTable];
    
    self.tabelaVistitados.allowsMultipleSelectionDuringEditing = NO;
    
    [tabelaVistitados reloadData];
    
    editTableButton = [[UIBarButtonItem alloc]
                       initWithTitle:@"Excluir"
                       style:UIBarButtonItemStyleDone
                       target:self
                       action:@selector(editTable:)];
    
    self.navigationItem.rightBarButtonItem = editTableButton;
    self.navigationItem.title = @"Países Favoritos";

    
    [labelNenhum setHidden:YES];
    
    if([paisArrayFavoritos count] == 0){
        [labelNenhum setHidden:NO];
        [tabelaVistitados setHidden:YES];
        [editTableButton setEnabled:NO];
    }

    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self atualizaTable];
    [tabelaVistitados reloadData];
    // Reload your data here, and this gets called
    // before the view transition is complete.
    if([paisArrayFavoritos count] == 0){
        [labelNenhum setHidden:NO];
        [tabelaVistitados setHidden:YES];
        [editTableButton setEnabled:NO];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* Método que atualiza a tabela com os paises marcados como favorito
 * Rafael Rezende Machado
 */
-(void)atualizaTable{
    paisFavoritos = [[NSArray alloc]init];
    paisArrayFavoritos = [[NSMutableArray alloc]init];
    paisFavoritos =  [[ModeloPais modeloCompartilhado] itens];
    
    //Verifica paises visitados
    for(Pais *elemento in paisFavoritos){
        if([elemento.visitado isEqualToString:@"true"]){
            [paisArrayFavoritos addObject:elemento];
        }
    }
    
    
}

/* Método que retorna o número de linhas da tabela
 * Rafael Rezende Machado
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [paisArrayFavoritos count];
    
}

/**
 * Método que recebe os dados para preencher a celula da tabela
 * @Rafael Rezende Machado (rafael.rezendem@hotmail.com)
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier;
    UITableViewCell *cell;
    
    cellIdentifier = @"myCell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
        
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    Pais *paisCell = nil;
    
    paisCell =[paisArrayFavoritos objectAtIndex:indexPath.row];
    
    DownloadImageView *recipeImageView = (DownloadImageView *)[cell viewWithTag:51];
    UILabel *label = (UILabel *)[cell viewWithTag:101];
    UIButton *button = (UIButton *) [cell viewWithTag:36];
    [button addTarget:self action:@selector(editTable:)   forControlEvents:UIControlEventTouchDown];
    
    label.text = paisCell.shortname;
    
    recipeImageView.url = paisCell.bandeira;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}
/**
 * Método que recebe o toque de excluir da tabela
 * Rafael Rezende Machado (rafael.rezendem@hotmail.com)
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Pais *paisTab = [paisArrayFavoritos objectAtIndex:indexPath.row];
        for(Pais *elemento in paisArrayFavoritos){
            if([paisTab.idPais isEqualToString:elemento.idPais]){
                [paisTab setDate:nil];
                [paisTab setVisitado:nil];
                [paisTab setSelected:@"false"];
                [[ModeloPais modeloCompartilhado] salvarMudancas];
                break;
            }
            
            if([paisArrayFavoritos count] == 0){
                [labelNenhum setHidden:NO];
                [tabelaVistitados setHidden:YES];
                [editTableButton setEnabled:NO];
            }
            
        }
        paisFavoritos = [[NSArray alloc]init];
        paisArrayFavoritos = [[NSMutableArray alloc]init];
        paisFavoritos =  [[ModeloPais modeloCompartilhado] itens];
        
        for(Pais *elemento in paisFavoritos){
            if([elemento.visitado isEqualToString:@"true"]){
                [paisArrayFavoritos addObject:elemento];
            }
        }
        [tabelaVistitados reloadData];
    }
}

/**
 * Método que recebe o toque na celula da tabela e vai para a tela de detalhes do país selecionado
 * @Rafael Rezende Machado (rafael.rezendem@hotmail.com)
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Recupera indice da linha selecionada.
    NSInteger linha = indexPath.row;
    
    Pais *paisTabela = [paisArrayFavoritos objectAtIndex:linha];
    
    DetalhesPaisViewController *detalhes = [[DetalhesPaisViewController alloc] init];
    
    NSString *nomeStoryboard = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:nomeStoryboard bundle: nil];
    detalhes = [storyboard instantiateViewControllerWithIdentifier:@"DetalhesPaisViewController"];
    
    
    detalhes.paisDetalhes = paisTabela;
    detalhes.arrayPaisDetalhes = paisArrayFavoritos;
    
    [self.navigationController pushViewController:detalhes animated:YES];
    
    
}



-(IBAction)editTable:(id)sender{
    
    [tabelaVistitados setEditing:![[self tabelaVistitados] isEditing] animated:YES];
}

@end
