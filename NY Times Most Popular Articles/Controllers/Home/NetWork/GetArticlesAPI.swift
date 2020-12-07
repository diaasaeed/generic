//
//  GetArticlesAPI.swift
//  NY Times Most Popular Articles
//
//  Created by Diaa saeed on 12/7/20.
//  Copyright © 2020 Diaa saeed. All rights reserved.
//

import Foundation
import Alamofire

@available(iOS 13.0, *)
class GetArticlesAPI{
    func getArticles( compilition: @escaping (statusCodeMsg,Bool,ArticleModel) -> Void){
 
        let url = "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=GwvLzymGxZmdrGJS0tiC3jiTFEambqPu"
        let headers = [
            "api-key":"GwvLzymGxZmdrGJS0tiC3jiTFEambqPu"
        ]
          Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.httpBody , headers: headers).responseJSON{ (response) in
          switch response.result{
          case .failure( let error):
            print(error.localizedDescription)
            let obj = ArticleModel()
            compilition(.noInternet,false,obj)
          // completion(nil,false,nil)
            break
          case .success( _):
            print("status code HOME",response.response?.statusCode)
            switch response.response?.statusCode {
            case 200:
                let json = response.data
                
                do{
                  //create json decoder
                    let decoder = JSONDecoder()
                    let loginData = try decoder.decode(ArticleModel.self, from: json!)
                   print("data is",loginData)
                    compilition(.success,true,loginData)
                    
                 }catch let error{
                    print("json not corret" , error)
                }
                break
            
            case 201:
                let json = response.data
                
                do{
                  //create json decoder
                    let decoder = JSONDecoder()
                    let loginData = try decoder.decode(ArticleModel.self, from: json!)
                    compilition(.success,true,loginData)
                    
                 }catch{
                    
                }
                break
               
            case 422:
                let json = response.data
 
                do{
                //create json decoder
                    let decoder = JSONDecoder()
                    let loginData = try decoder.decode(ArticleModel.self, from: json!)
                    print("data is " ,loginData )
                    compilition(.dataError,false,loginData)

                }catch{
                          
                }
                break
            
            case 400:
                let obj = ArticleModel()
                compilition(.badRequest,false,obj)
                break
                
            case 500:
                let obj = ArticleModel()
                compilition(.serverError,false,obj)
                break
                
            default:
                let obj = ArticleModel()
                compilition(.unKnownError,false,obj)
                break
            }
            
            break
          }
        }
    }
}
