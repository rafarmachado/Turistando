//
//  Perfil+CoreDataProperties.h
//  Turistando
//
//  Created by Rafael on 10/10/16.
//  Copyright © 2016 Rafael Rezende. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Perfil.h"

NS_ASSUME_NONNULL_BEGIN

@interface Perfil (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *nome;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSData *foto;
@property (nullable, nonatomic, retain) NSString *idFB;

@end

NS_ASSUME_NONNULL_END
