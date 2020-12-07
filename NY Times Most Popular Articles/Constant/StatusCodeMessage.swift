//
//  StatusCodeMessage.swift
//  NY Times Most Popular Articles
//
//  Created by Diaa saeed on 12/7/20.
//  Copyright © 2020 Diaa saeed. All rights reserved.
//

import Foundation
enum statusCodeMsg{
    case noInternet
    case badRequest
    case serverError
    case success
    case unKnownError
    case dataError
}


@available(iOS 13.0, *)
class errorLocalization{
   
    var Empty = ""
    var InvalidEmail = ""
    var lessThanMessageDates = ""
    var lessThanMessagepalms = ""
    var APIErrors = [String]()
    
    init(){
        APIErrors = ["no Internet", "Bad request", "Server error","UnKnown error"]
     }
    
    func getErrorTitle(statusCodeType : statusCodeMsg) -> String{
        switch statusCodeType {
        case .noInternet:
            return self.APIErrors[0]
            
        case .badRequest:
            return self.APIErrors[1]
            
        case .serverError:
            return self.APIErrors[2]
            
        case .unKnownError:
            return self.APIErrors[3]
            
        default:
            return ""
        }
    }
}
