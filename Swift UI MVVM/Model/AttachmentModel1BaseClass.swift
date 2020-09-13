//
//  AttachmentModel1BaseClass.swift
//
//  Created by Shourob Datta (Wipro Macbook) on 18/8/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct AttachmentModel1BaseClass: Codable,Identifiable {

  enum CodingKeys: String, CodingKey {
    case data
    case success
  }

  var id = UUID()
  var data: [AttachmentModel1Data]?
  var success: Bool?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    data = try container.decodeIfPresent([AttachmentModel1Data].self, forKey: .data)
    success = try container.decodeIfPresent(Bool.self, forKey: .success)
  }

}
