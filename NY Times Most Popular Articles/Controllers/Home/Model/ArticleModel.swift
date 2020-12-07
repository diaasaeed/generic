//
//  ArticleModel.swift
//  NY Times Most Popular Articles
//
//  Created by Diaa saeed on 12/7/20.
//  Copyright © 2020 Diaa saeed. All rights reserved.
//

import Foundation
// MARK: - Welcome
class ArticleModel: Codable {
    var status, copyright: String?
    var numResults: Int?
    var results: [Result]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }

 
}

// MARK: - Result
class Result: Codable {
    var uri: String?
    var url: String?
    var id, assetID: Int?
    var publishedDate, updated, section, subsection: String?
    var nytdsection, adxKeywords: String?
    var title, abstract: String?
    var desFacet, orgFacet, perFacet, geoFacet: [String]?
    var media: [Media]?
    var etaID: Int?
    var source:String?
    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection ,source
        case adxKeywords = "adx_keywords"
        case title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }

 
}

// MARK: - Media
class Media: Codable {
    var mediaMetadata: [MediaMetadatum]?

    enum CodingKeys: String, CodingKey {
          case mediaMetadata = "media-metadata"
    }

 
}

// MARK: - MediaMetadatum
class MediaMetadatum: Codable {
    var url: String?
    var height, width: Int?

   
}
