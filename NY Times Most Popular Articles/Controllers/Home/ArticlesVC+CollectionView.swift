//
//  ArticlesVC+CollectionView.swift
//  NY Times Most Popular Articles
//
//  Created by Diaa saeed on 12/7/20.
//  Copyright © 2020 Diaa saeed. All rights reserved.
//

import Foundation
import UIKit

extension mostpopularVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presntert?.countArticles() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.articlesCollectionView.dequeueReusableCell(withReuseIdentifier: "mostpopularCell", for: indexPath) as! mostpopularCell
        
        self.presntert?.configuer(cell: cell, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIScreen.main.bounds.width > 600 {
            return CGSize(width:  UIScreen.main.bounds.width/2, height: 150)
        }else{
            return CGSize(width:  UIScreen.main.bounds.width-20, height: 150)
         }
    }

}
