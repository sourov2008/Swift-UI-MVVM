//
//  PaginationBaseClass.swift
//
//  Created by shourob datta on 1/25/20
//  Copyright (c) . All rights reserved.
//

import Foundation

class PaginationBaseClass: Codable {

  enum CodingKeys: String, CodingKey {
    case pagination
  }

  var pagination: Pagination?

  init (pagination: Pagination?) {
    self.pagination = pagination
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    pagination = try container.decodeIfPresent(Pagination.self, forKey: .pagination)
  }

}
