//
//  Rating.swift
//  kirguStore
//
//  Created by Rizabek on 23.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import Foundation


struct Rating: Codable {
  
  let id: Int
  let name: String
  let image: String
  let level: String
  let rating: String
  let point: String
  
  enum CodingKeys: String, CodingKey {
    case rating = "rating_spot"
    case point =  "kirgu_point"
    case id
    case name
    case image
    case level
  }
}
