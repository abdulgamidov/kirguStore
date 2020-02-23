//
//  API.swift
//  kirguStore
//
//  Created by Rizabek on 22.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import Foundation
import Alamofire

enum API {
    case getCatalogList
    case getAchievementList
    case getRatingList
}

extension API {
    
    var baseUrl: String {
        return "http://192.168.43.97:8000/api/v1"
    }
    
    var path: String {
        
        switch self {
        case .getCatalogList:
          return "\(baseUrl)/catalog/"
          
        case .getAchievementList:
          return "\(baseUrl)/achievement/"
        
        case .getRatingList:
          return "\(baseUrl)/rating/"
        }
    }
    
    var method: HTTPMethod {
        
        switch self {
        case .getCatalogList, .getAchievementList, .getRatingList:
            return .get
        }
    }
    
    var params: [String: Any]? {
        switch self {
        default: return [:]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default: return URLEncoding.default
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        default:
            return [:]
        }
    }
}

enum APIError: Error {
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
}
