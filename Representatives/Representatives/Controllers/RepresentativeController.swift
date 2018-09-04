//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Markus Varner on 9/3/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    //MARK: - Base URL
    //http://whoismyrepresentative.com/getall_reps_bystate.php?state=CA
    
    static let shared = RepresentativeController()
    
    private let baseURLString = "https://whoismyrepresentative.com/getall_reps_bystate.php"
    
    
    //MARK: - Search Rep Func
    
    func searchRepresentatives(forState state: String, completion: @escaping ([Representative]?) -> Void) {
        
        //convert baseURL
        guard  let baseURL = URL(string: baseURLString) else {
            fatalError("🤬   Error converting baseURLString as a URL   🤬")
        }
        
        //get new url from baseURL, build url, get query items, setup URLSession, unwrap final url request
//        let newURL = baseURL.appendingPathComponent("&output=json").appendingPathComponent(state)
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let queryItems = URLQueryItem(name: "state", value: "\(state)")
        let queryItems2 = URLQueryItem(name: "output", value: "json")
        components?.queryItems = [queryItems, queryItems2]
        guard let url = components?.url else {completion([]); return}
        print("\(Thread.isMainThread)")
        //get data back from API with URLSession dataTask
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            //if error
            if let error = error {
                fatalError("🤬There was an Error with URLSession dataTask \(error) \(error.localizedDescription)🤬")
            }
            
            
            //check for nil data, if isnt nil decode data with json decoder
            guard let data = data else {completion([]); return}
            let asciiString = String(data: data, encoding: .ascii)
            let utf8String = Data(asciiString!.utf8)
            
            do {
                
                let results = try JSONDecoder().decode(Results.self, from: utf8String).results
                
                completion(results)
            } catch {
                print("🤬There was an Error decoding Representative Obj \(error) \(error.localizedDescription)🤬")
                completion([]); return
            }
            
            }.resume()
        
    }
    
    
}
/*
 
 
 */

