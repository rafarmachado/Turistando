//
//  ModeloPerfil.h
//  Turistando
//
// Created by Mac Mini on 10/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Perfil.h"

@interface ModeloPerfil : NSObject{
    NSMutableArray          *itens;
    NSManagedObjectContext  *contexto;
    NSManagedObjectModel    *modelo;
    
}

+ (ModeloPerfil *)modeloCompartilhado;

- (NSArray *)itens;
- (BOOL)salvarMudancas;
- (Perfil *)criarItem;
- (void)excluirItem:(Perfil *)produto;
- (void)excluirTodosOsItens;

@end
