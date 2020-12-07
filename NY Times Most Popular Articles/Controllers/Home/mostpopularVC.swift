//
//  mostpopularVC.swift
//  NY Times Most Popular Articles
//
//  Created by Diaa saeed on 12/7/20.
//  Copyright © 2020 Diaa saeed. All rights reserved.
//

import UIKit

class mostpopularVC: UIViewController ,Articlesprotocol{
  
    //MARK:- outlet
    @IBOutlet var articlesCollectionView: UICollectionView!
    @IBOutlet var viewLoading: UIView!
    
    var presntert:PresnterArticles?
    
    //MARK:- view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewLoading.layer.cornerRadius = 8
        viewLoading.clipsToBounds = true
         articlesCollectionView.register(UINib(nibName: "mostpopularCell", bundle: nil), forCellWithReuseIdentifier: "mostpopularCell")
        presntert = PresnterArticles(view:self)
        
        DispatchQueue.global().async {
            self.presntert?.getArticles()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewLoading.isHidden = true
    }

    
    //MARK:- implementaion protocol
    func showIndicator() {
        DispatchQueue.main.async {
            self.viewLoading.isHidden = false
         }
     }
     
     func hiddenIndicator() {
        DispatchQueue.main.async {
            self.viewLoading.isHidden = true
         }
     }
     
     func showError(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
     }
     
     func fetshingDataSuccess() {
        self.articlesCollectionView.reloadData()
     }
     
}

