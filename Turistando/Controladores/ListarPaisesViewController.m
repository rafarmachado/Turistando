//
//  ListarPaisesViewController.m
//  Turistando
//
//  Created by Mac Mini on 10/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//

#import "ListarPaisesViewController.h"

#define URL_PAISES @"http://sslapidev.mypush.com.br/world/countries/active"

@interface ListarPaisesViewController ()

@end

@implementation ListarPaisesViewController
@synthesize collectionPaises;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Seta os dados do navigation controller
    self.collectionPaises.dataSource = self;
    self.collectionPaises.delegate = self;
    
    self.navigationItem.title = @"Lista de Países";
    
    //Seta imagem de background da view
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    
    arrayListaPais = [[NSMutableArray alloc]init];
    arrayListaPais =  [[ModeloPais modeloCompartilhado] itens];
    
    if([arrayListaPais count]==0){
        [Funcionalidades startProgressCarregarPaises:self.view];
        [self atualizarPaises];
    }
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:NO];
    // Do any additional setup after loading the view.
    
    [collectionPaises reloadData];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Método que faz o download da lista de paises
-(void)atualizarPaises{
    
    ListaPaisesAsyncHelper *request = [[ListaPaisesAsyncHelper alloc]init];
    
    [request setDelegate:self];
    
    //Dispara Requisição
    [request doGet:URL_PAISES];
    
}

/**
 * Executa o parser dos dados retornados do JSON
 * @Rafael Rezende Machado (rafael.rezendem@hotmail.com)
 */
-(NSMutableArray *)parserJSON:(NSData *)data{
    if(!data || [data length] == 0){
        NSLog(@"Nenhum dado encontrado");
        return nil;
    }
    NSMutableArray *arrayTempPais = [[NSMutableArray alloc]init];
    
    //Inicializa Parser JSON.
    SBJsonParser *jsonParser = [SBJsonParser new];
    
    //Carrega NSData em um Dictionary.
    NSDictionary *dictPais = (NSDictionary *)[jsonParser objectWithData:data];
    
    @try{
        
        //O valor do país pesquisado é lido de um NSDictionary.
        for(NSDictionary *elemento in dictPais){
            
            Pais *paisAtual = [[ModeloPais  modeloCompartilhado] criarItem];
            [paisAtual setIdPais: [NSString stringWithFormat:@"%@",[elemento valueForKey:@"id"]]];
            [paisAtual setShortname:[elemento valueForKey:@"shortname"]];
            [paisAtual setIso:[elemento valueForKey:@"iso"]];
            [paisAtual setLongname:[elemento valueForKey:@"longname"]];
            [paisAtual setCallingCode:[NSString stringWithFormat:@"%@",[elemento valueForKey:@"callingCode"]]];
            [paisAtual setStatus:[NSString stringWithFormat:@"%@",[elemento valueForKey:@"status"]]];
            [paisAtual setCulture:[elemento valueForKey:@"culture"]];
            [paisAtual setSelected:@"false"];
            
            NSString *urlString = [NSString stringWithFormat:@"http://sslapidev.mypush.com.br/world/countries/%@/flag", paisAtual.idPais];
            
            [paisAtual setBandeira:urlString];
            [[ModeloPais modeloCompartilhado] salvarMudancas];
            
            [arrayTempPais addObject:paisAtual];
        }
        [Funcionalidades stopProgressBar:self.view];
        
        arrayListaPais = [[NSMutableArray alloc]init];
        arrayListaPais =  [[ModeloPais modeloCompartilhado] itens];
        
        [self.collectionPaises reloadData];
    } @catch (NSException *exception) {
        
        [Funcionalidades Alerta:@"Atenção!" msg:@"Ocorreu um erro ao pesquisar os paises, tente novamente mais tarde!"];
    }
    
    
    //Retorna os paises.
    return arrayTempPais;
}


-(void)requestEndWithData:(NSData *)data{
    
    if(data && [data length] > 0){
        arrayListaPais = [self parserJSON:data];
        [collectionPaises reloadData];

    }
    
    if(arrayListaPais && [arrayListaPais count] > 0){
        [self.collectionPaises reloadData];
        
    }else{
        [Funcionalidades Alerta:@"Atenção!" msg:@"Nenhum país encontrado!"];
    }
    
}

//Erro
-(void)requestEndWithError:(NSError *)error{
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return arrayListaPais.count;
}
/**
 * Recebe a imagem da bandeira, nome, se foi visitado ou não e preenche no collection
 * @Rafael Rezende Machado (rafael.rezendem@hotmail.com)
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"myCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    DownloadImageView *recipeImageView = (DownloadImageView *)[cell viewWithTag:50];
    UIImageView *check = (UIImageView *)[cell viewWithTag:75];
    
    Pais *paisCell=nil;
    paisCell =[arrayListaPais objectAtIndex:indexPath.row];
    label.text = paisCell.shortname;
    recipeImageView.url = paisCell.bandeira;
    
    if([paisCell.visitado isEqualToString:@"true"]){
        check.hidden = NO;
        
    }else{
        check.hidden = YES;
    }
    return cell;
}
/*
 * Método que recebe o toque no collection e direciona para os detalhes do pais
 * @Rafael Rezende Machado (rafael.rezendem@hotmail.com)
 */
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //Recupera indice da linha selecionada.
    NSInteger linha = indexPath.row;
    
    Pais *pais = [arrayListaPais objectAtIndex:linha];
    
    DetalhesPaisViewController *detalhes = [[DetalhesPaisViewController alloc] init];
    
    NSString *nomeStoryboard = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:nomeStoryboard bundle: nil];
    detalhes = [storyboard instantiateViewControllerWithIdentifier:@"DetalhesPaisViewController"];
    
    
    detalhes.paisDetalhes = pais;
    detalhes.arrayPaisDetalhes = arrayListaPais;
    
    [self.navigationController pushViewController:detalhes animated:YES];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
    NSArray *arrayOfIndexPaths = [self.collectionPaises indexPathsForSelectedItems];
    NSIndexPath *indexPathImInterestedIn = [arrayOfIndexPaths firstObject];
    Pais *paisTab = [arrayListaPais objectAtIndex:indexPathImInterestedIn.item];
    
    
    
    DetalhesPaisViewController *destViewController = segue.destinationViewController;
    destViewController.paisDetalhes = paisTab;
    destViewController.arrayPaisDetalhes = arrayListaPais;
    
}

@end
