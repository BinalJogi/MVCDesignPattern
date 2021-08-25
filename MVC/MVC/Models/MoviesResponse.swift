//
//  MoviesResponse.swift
//  MVC
//
//  Created by Binal on 24/08/2021.
//

// All Business Logic will be in Model for MVC Pattern
import Foundation

struct MoviesResponse: Decodable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults : Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}


