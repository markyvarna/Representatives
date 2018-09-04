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
    
    static let baseURLString = "https://whoismyrepresentative.com/getall_reps_bystate.php?state=CA&output=json"
    
    
    //MARK: - Search Rep Func
    
    func searchRepresentatives(forState state: String, completion: @escaping ([Representative]?) -> Void) {
        
        //convert baseURL
        guard  let baseURL = URL(string: RepresentativeController.baseURLString) else {
            fatalError("🤬   Error converting baseURLString as a URL   🤬")
        }
        
        //get new url from baseURL, build url, get query items, setup URLSession, unwrap final url request
        let newURL = baseURL.appendingPathComponent(state).appendingPathComponent("CA")
        var components = URLComponents(url: newURL, resolvingAgainstBaseURL: true)
        let queryItems = URLQueryItem(name: "state", value: "\(state)")
        components?.queryItems = [queryItems]
        guard let url = components?.url else {completion([]); return}
        
        //get data back from API with URLSession dataTask
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            //if error
            if let error = error {
                fatalError("🤬There was an Error with URLSession dataTask \(error) \(error.localizedDescription)🤬")
            }
            
            //check for nil data, if isnt nil decode data with json decoder
            guard let data = data else {completion([]); return}
            let asciiString = String(data: data, encoding: .ascii)
            let dataAsUTF8 = Data(asciiString!.utf8)
            
            do {
                let results = try JSONDecoder().decode(Results.self, from: data).results
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

