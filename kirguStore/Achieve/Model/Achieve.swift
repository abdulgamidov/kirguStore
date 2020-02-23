//
//  Achieve.swift
//  kirguStore
//
//  Created by Rizabek on 22.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import Foundation


struct Achieve: Codable {
  let id: Int
  let name: String
  let image: String
  let desc: String
  let progress: String
  let point: String
  
  enum CodingKeys: String, CodingKey {
    case desc = "descriptions"
    case point =  "kirgu_point"
    case id
    case name
    case image
    case progress
  }
}
