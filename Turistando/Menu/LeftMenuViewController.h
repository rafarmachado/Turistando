//
//  MenuViewController.h
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SlideNavigationController.h"
#import "MenuLateralEsquerdoViewCell.h"
#import "ModeloPerfil.h"


@interface LeftMenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>


@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
@property (weak, nonatomic) IBOutlet UILabel *txtMenu;
@property (weak, nonatomic) IBOutlet UIImageView *imgIconeMenu;
@property (strong, nonatomic) IBOutlet UIImageView *imagemPerfilFbMenu;


@end
