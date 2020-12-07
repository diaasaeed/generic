//
//  mostpopularCell.swift
//  NY Times Most Popular Articles
//
//  Created by Diaa saeed on 12/7/20.
//  Copyright © 2020 Diaa saeed. All rights reserved.
//

import UIKit
import SDWebImage
class mostpopularCell: UICollectionViewCell ,ArticleCellProtocols{


    @IBOutlet var imageArticle: UIImageView!
    @IBOutlet var titleArticle: UILabel!
    @IBOutlet var descriptionTitle: UILabel!
    @IBOutlet var sourceArticle: UILabel!
    @IBOutlet var dateArticle: UILabel!
    @IBOutlet var viewCell: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageArticle.layer.cornerRadius = 35
        imageArticle.clipsToBounds = true
     
    }

    
    func image(url: String) {
        self.imageArticle.sd_setImage(with: URL(string:url), completed: nil)
    }
    
    func titleArticle(txt: String) {
        self.titleArticle.text = txt
    }
    
    func descriptionArticle(txt: String) {
        self.descriptionTitle.text = txt
    }
    
    func date(txt: String) {
        self.dateArticle.text = txt
    }
    
    func sourseArticle(txt: String) {
        self.sourceArticle.text = txt
    }
    
}
