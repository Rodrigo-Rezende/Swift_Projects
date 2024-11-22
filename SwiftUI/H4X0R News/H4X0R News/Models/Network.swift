//
//  Network.swift
//  H4X0R News
//
//  Created by Rodrigo Rezende on 06/06/24.
//

import Foundation

class Network: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
//        Create URL from string safely
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
//            Create URLSession
            let session = URLSession(configuration: .default)
//            Create a task in the session using the given URL witch will have data, response and error
            let task = session.dataTask(with: url) { data, response, error in
//                Check if there is an error
                if error == nil {
//                    Create a decoder
                    let decoder = JSONDecoder()
//                    Check if the data was correctly obtained and store it in safeData
                    if let safeData = data {
//                        Use a do try catch block to decode the data obtained in safeData
                        do {
//                            Create a result of the task witch is the decoding of the safeData into a struct compatible with the JSON
                            let result = try decoder.decode(PostData.self, from: safeData)
//                            Makes sure that the updates from the API are listened by the main thread
                            DispatchQueue.main.async {
                                self.posts = result.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
//            Starts of the networking task
            task.resume()
        }
    }
    
}
