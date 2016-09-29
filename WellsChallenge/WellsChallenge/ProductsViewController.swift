//
//  ProductsViewController.swift
//  WellsChallenge
//
//  Created by Adrian Roe on 9/28/16.
//  Copyright © 2016 AdrianRoe. All rights reserved.
//

import UIKit
import ionicons

class ProductsViewController : BaseViewController{
    
    @IBOutlet weak var TableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    func setupNavigationBar ()
    {
        let backButton = UIBarButtonItem(image: IonIcons.imageWithIcon(ion_ios_arrow_back, size: 44, color: UIColor(netHex: WELLS_BLUE)), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ProductsViewController.popToRoot(_:)))
        self.navigationItem.leftBarButtonItem = backButton
    }
    func popToRoot(sender:UIBarButtonItem){
        self.navigationController!.popToRootViewControllerAnimated(true)
    }

  
}
