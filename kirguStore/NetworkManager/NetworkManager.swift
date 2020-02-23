//
//  NetworkManager.swift
//  kirguStore
//
//  Created by Rizabek on 22.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
  func request<T: Decodable>(api: API, success: @escaping (T) -> Void, failure: @escaping (T) -> Void)
}

final class NetworkManager {
  func request<T: Decodable>(api: API, success: @escaping (T) -> Void, failure: @escaping (T) -> Void) {
    AF.request(api.path, method: api.method, parameters: api.params, encoding: api.encoding, headers: api.headers).responseJSON { (response) in
      switch response.result {
      case .success:
        do {
          guard let data = response.data else {
            print(response.error ?? APIError.notFound)
            return
          }
          let result = try! JSONDecoder().decode(T.self, from: data)
          success(result)
        }
      case .failure(let error):
        return print(error)
        }
      
      }
    }
  }
