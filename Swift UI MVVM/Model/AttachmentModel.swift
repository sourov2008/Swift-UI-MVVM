//
//  AttachmentModel.swift
//
//  Created by Shourob Datta (Wipro Macbook) on 18/8/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct AttachmentModel: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case objectId = "object_id"
    case modified
    case url
    case objectType = "object_type"
    case fileName = "file_name"
    case mimeType = "mime_type"
    case size
    case path
    case created
  }

  var id: Int?
  var objectId: Int?
  var modified: String?
  var url: String?
  var objectType: String?
  var fileName: String?
  var mimeType: String?
  var size: Int?
  var path: String?
  var created: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    objectId = try container.decodeIfPresent(Int.self, forKey: .objectId)
    modified = try container.decodeIfPresent(String.self, forKey: .modified)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    objectType = try container.decodeIfPresent(String.self, forKey: .objectType)
    fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
    mimeType = try container.decodeIfPresent(String.self, forKey: .mimeType)
    size = try container.decodeIfPresent(Int.self, forKey: .size)
    path = try container.decodeIfPresent(String.self, forKey: .path)
    created = try container.decodeIfPresent(String.self, forKey: .created)
  }

}
