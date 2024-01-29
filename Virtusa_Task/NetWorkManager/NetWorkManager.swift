//
//  NetWorkManager.swift
//  Virtusa_Task
//
//  Created by Apple on 29/01/24.
//

import Foundation

class NetworkManger {

    func getDataFromServerMethod(urlStr: String, params: [String : AnyObject], sucess: @escaping (ArtWorksModel) -> (), failure: @escaping (String) -> ()) {
        guard let url = URL(string: urlStr) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                if let jsonData = try? JSONDecoder().decode(ArtWorksModel.self, from: data) {
                    sucess(jsonData)
                }
                    
            } catch let error {
                print(error.localizedDescription)
                failure(error.localizedDescription)
            }
        }
        dataTask.resume()
        
        
    }
    
}
