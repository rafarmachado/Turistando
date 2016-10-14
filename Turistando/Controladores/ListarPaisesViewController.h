//
//  ListarPaisesViewController.h
//  Turistando
//
//  Created by Mac Mini on 10/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Pais.h"
#import "SBJson.h"
#import "ModeloPais.h"
#import "Pais+CoreDataProperties.h"
#import "Funcionalidades.h"
#import "ViewController.h"
#import "ListaPaisesAsyncHelper.h"
#import "DetalhesPaisViewController.h"


@interface ListarPaisesViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, NSURLSessionDataDelegate>{
    
    NSArray *arrayListaPais;    
}


@property (strong, nonatomic) IBOutlet UICollectionView *collectionPaises;


@end
