//
//  ModelGenericDocument.swift
//  Swift UI MVVM
//
//  Created by Shourob Datta (Wipro Macbook) on 18/8/20.
//  Copyright © 2020 Shourob. All rights reserved.
//

import Foundation

struct ModelGenericDocument {
    
    var fileName : String?
    var extention : String?
    var fileData : Data?
    var fileSize : Double?
    var nameVariable : String?

    
    init(fileName: String?, extention: String?, fileData: Data?, fileSize: Double? , nameVariable : String?){
        self.fileName = fileName
        self.extention = extention
        self.fileData = fileData
        self.fileSize = fileSize
        self.nameVariable = nameVariable
    }
    
}
