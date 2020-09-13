//
//  EmployeeViewModel.swift
//  Swift UI MVVM
//
//  Created by Shourob Datta (Wipro Macbook) on 18/8/20.
//  Copyright © 2020 Shourob. All rights reserved.
//

import Foundation
import Combine


protocol EmployeeViewModelProtocol {

    func fetchEmployeeList()
}


final class EmployeeViewModel: ObservableObject {
//    @Published var todos = [Todo]()
//    @Published var showCompleted = false
    
    @Published var employees = [AttachmentModel1Data]()
    @Published var isCompleted = false

    
 
    init() {
         //fetchEmployeeList()
    }
}


extension EmployeeViewModel :EmployeeViewModelProtocol {
    

    func fetchEmployeeList(){
        let service = APIService()

        
        //employees/contacts
        //attachments?object_id=200&object_type=Issues
        service.genericGET(relativePath: "/attachments?object_id=200&object_type=Issues") { (isSuccess, responseObject:AttachmentModel1BaseClass?, error) in
            
            print (responseObject ?? "")
            
            self.employees = (responseObject?.data)!
            self.isCompleted = true
            //
        }
        
        
        
    }
    
}
