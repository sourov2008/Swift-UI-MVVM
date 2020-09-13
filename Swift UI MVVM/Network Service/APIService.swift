//
//  GenericGetService.swift
//  GpEmployee
//
//  Created by shourob datta on 11/22/19.
//  Copyright © 2019 Grameenphone Ltd. All rights reserved.
//


import Foundation
import Alamofire

struct APIService {
    
    // MARK: non paginated get methods.
    /**
     non paginated get methods.
     Generic Purpose
     */

    func genericGET<T: Decodable>(relativePath:String, completion: @escaping (_ success: Bool, T?,  _ error : Error?) -> ()) {
        Alamofire.request(NetworkRouter.fetchDataFormEndpoint(relativePath))
            .responseJSON { response in
                // check for errors
                switch response.result {
                case .success(_):
                    
                    let value = response.result.value
                    let jsonDict = value as? [String: Any]
                    let successStatus = jsonDict!["success"] as! Bool
                    
                    guard successStatus == true else{
                        // Error: Network success true. However backend code response error . like Token Expired validationn error or controller not founnd
                        // Send Custom Error
                        let  networkHelper = NetworkHelper()
                        let resposeDataDcit = jsonDict!["data"]
                        completion(false,nil, networkHelper.getGeneralizedErrorMessageFromErrorSwiftVersion(errorData: resposeDataDcit as AnyObject))
                        return
                    }
                    // Success true processing
                    if let data = response.data {
                        do {
                            let dataObj = try JSONDecoder().decode(T.self, from: data)
                            completion(true,dataObj, nil)
                        } catch {
                            //completion(false, nil, NSError(domain:"Pending bill list decode error", code:100, userInfo:nil))
                            print("Error")
                            completion(true, nil, NSError(domain:"Data decode error, contact with developer", code:100, userInfo:nil))
                        }
                    }
                    else{
                        completion(true, nil, NSError(domain:"Data decode error, contact with developer", code:100, userInfo:nil))
                        print("Error")
                    }
                    
                    break
                    
                case .failure(_):
                    completion(false,nil, response.result.error)
                    break
                }
        }
        
    }
    
    
    // MARK:  paginated get methods.
    /**
     paginated get methods.
     Generic Purpose
     */

    func genericPaginatedGET<T: Decodable>(relativePath:String, completion: @escaping (_ success: Bool, T?, _ pagination: PaginationBaseClass?,   _ error : Error?) -> ()) {
                
        Alamofire.request(NetworkRouter.fetchDataFormEndpoint(relativePath))
            .responseJSON { response in
                // check for errors
                switch response.result {
                case .success(_):
                    
                    let value = response.result.value
                    let jsonDict = value as? [String: Any]
                    let successStatus = jsonDict!["success"] as! Bool
                    
                    guard successStatus == true else{
                        // Error: Network success true. However backend code response error . like Token Expired validationn error or controller not founnd
                        // Send Custom Error
                        let  networkHelper = NetworkHelper()
                        let resposeDataDcit = jsonDict!["data"]
                        completion(false,nil, nil, networkHelper.getGeneralizedErrorMessageFromErrorSwiftVersion(errorData: resposeDataDcit as AnyObject))
                        return
                    }
                    // Success true processing
                    if let data = response.data {
                        do {
                            let dataObj = try JSONDecoder().decode(T.self, from: data)
                            let paginetedDict = try JSONDecoder().decode(PaginationBaseClass.self,from: data)

                            completion(true,dataObj, paginetedDict, nil)
                        } catch {
                            //completion(false, nil, NSError(domain:"Pending bill list decode error", code:100, userInfo:nil))
                            print("Error")
                            completion(true, nil, nil, NSError(domain:"Data decode error, contact with developer", code:100, userInfo:nil))
                        }
                    }
                    else{
                        completion(true, nil, nil, NSError(domain:"Data decode error, contact with developer", code:100, userInfo:nil))
                        print("Error")
                    }
                    
                    break
                    
                case .failure(_):
                    completion(false,nil,nil, response.result.error)
                    break
                }
        }
        
    }
    
    
    
    // MARK:  GENERIC POST MMETHOD.
    /**
     Post methods.
     Generic Purpose
     */

    func genericPOST<T: Decodable>(relativePath:String,  paramDict:[String: Any], completion: @escaping (_ success: Bool, T?,  _ error : Error?) -> ()) {
        
        Alamofire.request(NetworkRouter.postGeneric(relativePath, paramDict))
            .responseJSON { response in
                
                switch response.result {
                case .success(_):
                    
                    let value = response.result.value
                    let jsonDict = value as? [String: Any]
                    let successStatus = jsonDict!["success"] as! Bool
                    
                    guard successStatus == true else{
                        // Error: Network success true. However backend code response error . like Token Expired validationn error or controller not founnd
                        // Send Custom Error
                        let  networkHelper = NetworkHelper()
                        let resposeDataDcit = jsonDict!["data"]
                        completion(false,nil, networkHelper.getGeneralizedErrorMessageFromErrorSwiftVersion(errorData: resposeDataDcit as AnyObject))
                        return
                    }
                    // Success true processing
                    if let data = response.data {
                        do {
                            let dataObj = try JSONDecoder().decode(T.self, from: data)
                            completion(true,dataObj, nil)
                        } catch {
                            //completion(false, nil, NSError(domain:"Pending bill list decode error", code:100, userInfo:nil))
                            print("Error")
                            // here we will send success true means. data successfully updated
                            completion(true, nil, NSError(domain:"Data decode error, contact with developer", code:100, userInfo:nil))
                        }
                    }
                    else{
                        completion(true, nil, NSError(domain:"Data decode error, contact with developer", code:100, userInfo:nil))
                        print("Error")
                    }
                    
                    break
                    
                case .failure(_):
                    completion(false,nil, response.result.error)
                    break
                }
        }
        
    }
    
    
    
    // MARK:  Generic Update methods.
    /**
     PUT methods.
     Generic Purpose
     */

    // MARK:  Generic PUT methods.
    /**
     PUT methods.
     Generic Purpose
     */
    
    func genericPUT<T: Decodable>(relativePath:String,  paramDict:[String: Any], completion: @escaping (_ success: Bool, T?,  _ error : Error?) -> ()) {

        Alamofire.request(NetworkRouter.updateGeneric(relativePath, paramDict))
            .responseJSON { response in

            switch response.result {
            case .success(_):
                
                let value = response.result.value
                let jsonDict = value as? [String: Any]
                let successStatus = jsonDict!["success"] as! Bool
                
                guard successStatus == true else{
                    // Error: Network success true. However backend code response error . like Token Expired validationn error or controller not founnd
                    // Send Custom Error
                    let  networkHelper = NetworkHelper()
                    let resposeDataDcit = jsonDict!["data"]
                    completion(false,nil, networkHelper.getGeneralizedErrorMessageFromErrorSwiftVersion(errorData: resposeDataDcit as AnyObject))
                    return
                }
                // Success true processing
                if let data = response.data {
                    do {
                        let dataObj = try JSONDecoder().decode(T.self, from: data)
                        completion(true,dataObj, nil)
                    } catch {
                        //completion(false, nil, NSError(domain:"Pending bill list decode error", code:100, userInfo:nil))
                        print("Error")
                        // here we will send success true means. data successfully updated
                        completion(true, nil, NSError(domain:"Data decode error, contact with developer", code:100, userInfo:nil))
                    }
                }
                else{
                    completion(true, nil, NSError(domain:"Data decode error, contact with developer", code:100, userInfo:nil))
                    print("Error")
                }
                
                break
                
            case .failure(_):
                completion(false,nil, response.result.error)
                break
            }
        }
        
    }
    
    
    // MARK:  GENERIC DELETE METHOD.
    /**
     PUT methods.
     Generic Purpose
     */

    func genericDelete<T: Decodable>(relativePath:String, completion: @escaping (_ success: Bool, T?,  _ error : Error?) -> ()) {
        
        Alamofire.request(NetworkRouter.deleteGeneric(relativePath))
            .responseJSON { response in
                
                switch response.result {
                case .success(_):
                    
                    let value = response.result.value
                    let jsonDict = value as? [String: Any]
                    let successStatus = jsonDict!["success"] as! Bool
                    
                    guard successStatus == true else{
                        // Error: Network success true. However backend code response error . like Token Expired validationn error or controller not founnd
                        // Send Custom Error
                        let  networkHelper = NetworkHelper()
                        let resposeDataDcit = jsonDict!["data"]
                        completion(false,nil, networkHelper.getGeneralizedErrorMessageFromErrorSwiftVersion(errorData: resposeDataDcit as AnyObject))
                        return
                    }
                    // Success true processing
                    if let data = response.data {
                        do {
                            let dataObj = try JSONDecoder().decode(T.self, from: data)
                            completion(true,dataObj, nil)
                        } catch {
                            //completion(false, nil, NSError(domain:"Pending bill list decode error", code:100, userInfo:nil))
                            print("Error")
                            // here we will send success true means. data successfully updated
                            completion(true, nil, NSError(domain:"Data decode error, contact with developer", code:100, userInfo:nil))
                        }
                    }
                    else{
                        completion(true, nil, NSError(domain:"Data decode error, contact with developer", code:100, userInfo:nil))
                        print("Error")
                    }
                    
                    break
                    
                case .failure(_):
                    completion(false,nil, response.result.error)
                    break
                }
        }
        
    }


    
    /**
     https://stackoverflow.com/questions/26412741/file-upload-with-alamofire-router
         @param : multipartEncoding
         
         let image = UIImage(named: "Something")!

         guard let imageData = image.pngData() else {
             // We couldn't convert the image into data :(
             
             return
         }

        This is a clouser
         let multipartEncoding: (MultipartFormData) -> Void = { multipartFormData in
            
            for() // starts{
            
            // append
             multipartFormData.append(imageData, withName: "image", fileName: "image.png", mimeType: "image/png")
             
            }
         }
     
     
     */

    
    //func genericUpload<T: Decodable>(relativePath:String,  paramDict:[String: Any], multipartEncoding:@escaping (MultipartFormData) -> Void, completion: @escaping (_ success: Bool, T?,  _ error : Error?) -> ()) {

    func genericUpload<T: Decodable>(relativePath:String,  paramDict:[String: String], fileArray:[ModelGenericDocument] , completion: @escaping (_ success: Bool, T?,  _ error : Error?) -> ()) {

        let multipartEncoding: (MultipartFormData) -> Void = { multipartFormData in

            for fileItem in fileArray{
                multipartFormData.append(fileItem.fileData!, withName: fileItem.nameVariable!, fileName: fileItem.fileName!, mimeType: "image/jpeg")
            }
            for (key, value) in paramDict {
                multipartFormData.append((value.data(using: .utf8))!, withName: key)
            }
        }

        let emptyDict : [String : Any] = [:]
        
        let request = NetworkRouter.postGeneric(relativePath, emptyDict) // This is just a plain POST

        Alamofire.upload(
            multipartFormData: multipartEncoding,
            with: request,
            encodingCompletion: { (encodingResult) in
                switch encodingResult {
                case .success(let request, _, _):
                    request.validate().responseJSON(completionHandler: { (response) in
                        
                        /* I think not useful this section*/
//                        guard response.result.isFailure == false else{
//
//                            completion(true, nil, NSError(domain:"There is somethings error", code:100, userInfo:nil))
//                            print(response.result.error?.localizedDescription ?? "")
//                            return
//
//                        }
                        
                        /*  */
                            
                        let value = response.result.value
                        let jsonDict = value as? [String: Any]
                        let successStatus = jsonDict?["success"] as! Bool
                        
                        guard successStatus == true else{
                            // Error: Network success true. However backend code response error . like Token Expired, validationn error or controller not founnd
                            // Send Custom Error
                            let  networkHelper = NetworkHelper()
                            let resposeDataDcit = jsonDict!["data"]
                            completion(false,nil, networkHelper.getGeneralizedErrorMessageFromErrorSwiftVersion(errorData: resposeDataDcit as AnyObject))
                            return
                        }
                        // Success true processing
                        if let data = response.data {
                            do {
                                let dataObj = try JSONDecoder().decode(T.self, from: data)
                                completion(true,dataObj, nil)
                            } catch {
                                //completion(false, nil, NSError(domain:"Pending bill list decode error", code:100, userInfo:nil))
                                print("Error")
                                // here we will send success true means. data successfully updated
                                completion(true, nil, NSError(domain:"Data decode error, contact with developer", code:100, userInfo:nil))
                            }
                        }
                        else{
                            completion(true, nil, NSError(domain:"Data decode error, contact with developer", code:100, userInfo:nil))
                            print("Error")
                        }
                        
                        
                    })
                    break
                    
                case .failure(let encodingError):
                    completion(false,nil, encodingError)
                    break
                }
        })
                
        
    }
           
}





