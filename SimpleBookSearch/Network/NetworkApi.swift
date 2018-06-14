//
//  NetworkApi.swift
//  SimpleBookSearch
//
//  Created by Surendra Singh on 5/31/18.
//  Copyright © 2018 Surendra Singh. All rights reserved.
//

import UIKit

class NetworkApi: NSObject {
    static let shared = NetworkApi()
    var url:URL!
    
    //NetworkApi Initialization
    private override init() {
        self.url = URL(string: HOST_NAME)
        self.url = self.url.appendingPathComponent(API_NAME)
        self.url = self.url.appendingPathComponent(API_VERSION)
    }
    
    
    func searchBookByString(searchText:String?, completionHandler:@escaping(Data?, Error?) -> Void){
        
        guard let searchText = searchText else {
            completionHandler(nil, self.createError(forMesssage: "Input text is invalide."))
            return
        }
        
        let requestUrl = self.url.appendingPathComponent("volumes") as URL
        var urlComponents = URLComponents(string: requestUrl.absoluteString)!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: searchText),
            URLQueryItem(name: "key", value: APP_KEY)
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        
        do {
            try self.sendHTTPRequest(request, completionHandler: { (data, error) in
                completionHandler(data, error)
            })
        }catch let error{
            completionHandler(nil, error)
        }
    }
    
    //Send HTTP Request
    private func sendHTTPRequest(_ urlRequest:URLRequest, completionHandler:@escaping(Data?,Error?) -> Void) throws {
        
        #if DEBUG
            print("\nRequest url : ",(urlRequest.url?.absoluteString)!)
            print("Request method : ",urlRequest.httpMethod!)
            print("Request method : ",urlRequest.allHTTPHeaderFields!)
        #endif
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: {[unowned self](data, response, error) in
            
            if let error = error{
                #if DEBUG
                    print("Error :", error.localizedDescription)
                #endif
                completionHandler(nil, error)
            }else if let data = data , (response as! HTTPURLResponse).statusCode == 200{
                
                #if DEBUG
                    if let response  = response {
                        print("Status code :", (response as! HTTPURLResponse).statusCode)
                    }
                    print("Recieved byte :", data)
                    print("Recieved json :", String(data:data.count > 0 ? data:"No Data Recieved".data(using: String.Encoding.utf8)!, encoding:String.Encoding.utf8)!)
                #endif
                
                completionHandler(data, error)
            }else if let response = response{
                #if DEBUG
                    print("Error :", HTTPURLResponse.localizedString(forStatusCode: (response as! HTTPURLResponse).statusCode))
                #endif
                
                let errorTemp = NSError(domain:"", code:(response as! HTTPURLResponse).statusCode, userInfo:nil)
                completionHandler(nil, errorTemp)
            }else{
                #if DEBUG
                    print("Error : Unknown error")
                #endif
                
                
                completionHandler(nil, self.createError(forMesssage: "Unknown error"))
            }
        })
        task.resume()
        URLSession.shared.finishTasksAndInvalidate()
        
    }
    
    //Create custom error
    private func createError(forMesssage:String) -> Error{
        let userInfo = [NSLocalizedDescriptionKey: NSLocalizedString(forMesssage, tableName: nil, comment: forMesssage),
                        NSLocalizedFailureReasonErrorKey: NSLocalizedString(forMesssage, tableName: nil, comment: forMesssage),
                        NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(forMesssage, tableName: nil, comment: forMesssage)]
        let errorTemp = NSError(domain:"", code:-100, userInfo:userInfo)
        return errorTemp
    }

}
