//
//  NetworkError.swift
//  MVC
//
//  Created by Binal on 25/08/2021.
//

import Foundation

enum NetworkError: Error {
    case url
    case other(Error)
}
