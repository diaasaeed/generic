//
//  PresnterArticles.swift
//  NY Times Most Popular Articles
//
//  Created by Diaa saeed on 12/7/20.
//  Copyright © 2020 Diaa saeed. All rights reserved.
//

import Foundation
protocol Articlesprotocol {
    func showIndicator()
    func hiddenIndicator()
    func showError(message:String)
    func fetshingDataSuccess()
}

protocol ArticleCellProtocols {
    func image(url:String)
    func titleArticle(txt:String)
    func descriptionArticle(txt:String)
    func date(txt:String)
    func sourseArticle(txt:String)
}

class PresnterArticles{
    private var view:Articlesprotocol?
    private var interactor = GetArticlesAPI()
    private var error = errorLocalization()
    private var articles = ArticleModel()
    
    init(view:Articlesprotocol) {
        self.view = view
    }
    
    // call data from services
    func getArticles(){
        self.view?.showIndicator()
        interactor.getArticles { (statusCodeMsg, success, data) in
            self.view?.hiddenIndicator()
        
            if success == true {
                self.articles = data
                self.view?.fetshingDataSuccess()
            }else{
                // error when send data
                if statusCodeMsg == .dataError{
                    self.view?.showError(message: "Data error")
                }else{
                    //error if not have network or internal server
                    self.view?.showError(message: self.error.getErrorTitle(statusCodeType: statusCodeMsg))
                }
            }
        }
    }
    
    //count array of articles
    func countArticles()->Int{
        return self.articles.results?.count ?? 0
    }
    
    
    // Configuer cell articels
    func configuer(cell:ArticleCellProtocols,index:Int){
        let data = self.articles.results?[index]
        cell.titleArticle(txt: data?.title ?? "")
        cell.descriptionArticle(txt: data?.abstract ?? "")
        cell.date(txt: data?.publishedDate ?? "")
        cell.sourseArticle(txt: data?.source ?? "")
        if data?.media?.count == 0 && data?.media?[0].mediaMetadata?.count == 0{
            //not have images
        }else{
            //have images
            cell.image(url: data?.media?[0].mediaMetadata?[0].url ?? "")
        }
    }
}
