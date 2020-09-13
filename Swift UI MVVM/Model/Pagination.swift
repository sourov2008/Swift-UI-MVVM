//
//  Pagination.swift
//
//  Created by shourob datta on 1/25/20
//  Copyright (c) . All rights reserved.
//

import Foundation

class Pagination: Codable {

  enum CodingKeys: String, CodingKey {
    case hasNextPage = "has_next_page"
    case pageCount = "page_count"
    case hasPrevPage = "has_prev_page"
    case count
    case currentPage = "current_page"
  }

  var hasNextPage: Bool?
  var pageCount: Int?
  var hasPrevPage: Bool?
  var count: Int?
  var currentPage: Int?

  init (hasNextPage: Bool?, pageCount: Int?, hasPrevPage: Bool?, count: Int?, currentPage: Int?) {
    self.hasNextPage = hasNextPage
    self.pageCount = pageCount
    self.hasPrevPage = hasPrevPage
    self.count = count
    self.currentPage = currentPage
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    hasNextPage = try container.decodeIfPresent(Bool.self, forKey: .hasNextPage)
    pageCount = try container.decodeIfPresent(Int.self, forKey: .pageCount)
    hasPrevPage = try container.decodeIfPresent(Bool.self, forKey: .hasPrevPage)
    count = try container.decodeIfPresent(Int.self, forKey: .count)
    currentPage = try container.decodeIfPresent(Int.self, forKey: .currentPage)
  }

}
