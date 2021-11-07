//
//  NetworkManager.swift
//  workingWithTheNetwork
//
//  Created by Kirill Drozdov on 07.11.2021.
//

import Foundation
import UIKit

class NetworkManager{
    
    let sessionCongigaratiom = URLSessionConfiguration.default
    let session = URLSession.shared
    var decoder = JSONDecoder()
    
    func obtainPost(succesComletion: @escaping([Posts])->Void, failrureComletion:@escaping(Error)->Void ){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        session.dataTask(with: url) { [self] (data, response, error) in
            guard let data = data else {
                failrureComletion(error?.localizedDescription as! Error)
                return}
            if error == nil {
    
                guard  let posts = try? decoder.decode([Posts].self, from: data) else {
                    failrureComletion(error?.localizedDescription as! Error)
                    return}
                
                succesComletion(posts)
                
                
            }else{
                
                failrureComletion(error?.localizedDescription as! Error)
            }
            
        }.resume()
    }
}
