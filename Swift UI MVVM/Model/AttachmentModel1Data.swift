//
//  AttachmentModel1Data.swift
//
//  Created by Shourob Datta (Wipro Macbook) on 18/8/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct AttachmentModel1Data: Codable,Identifiable {

  enum CodingKeys: String, CodingKey {
    case modified
    case objectId = "object_id"
    case size
    case objectType = "object_type"
    case fileName = "file_name"
    case url
    case path
    case created
    case id
    case mimeType = "mime_type"
  }

  var modified: String?
  var objectId: Int?
  var size: Int?
  var objectType: String?
  var fileName: String?
  var url: String?
  var path: String?
  var created: String?
  var id: Int?
  var mimeType: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    modified = try container.decodeIfPresent(String.self, forKey: .modified)
    objectId = try container.decodeIfPresent(Int.self, forKey: .objectId)
    size = try container.decodeIfPresent(Int.self, forKey: .size)
    objectType = try container.decodeIfPresent(String.self, forKey: .objectType)
    fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    path = try container.decodeIfPresent(String.self, forKey: .path)
    created = try container.decodeIfPresent(String.self, forKey: .created)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    mimeType = try container.decodeIfPresent(String.self, forKey: .mimeType)
  }

}
