//
//  RepresentativeController.swift
//  Representative
//
//  Created by jdcorn on 11/20/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

import Foundation

/// This class with use the URLSession to fetch data and deserialize the results into Represetative objets.
class RepresentativeController {
    
    /// baseURL
    /// We want the reps per state where we will change the state based on the users serach.
    static let baseURL = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    /// Create a static function that allows the developer to pass in the search parameter, create a dataTask to fetch the rep's data, then provide an array of rep objects.
    /// The completion handler should pass back a non optional array.
    static func searchRepresentatives(forState state: String, completion: @escaping (([Representative])
        -> Void)) {
        
        /// Create a dicitonary of the URL parameters for the state and the ouput types.
        /// Create an array of URLQueryItems from the dictionary.
        guard let url = baseURL else { completion([]); return }
        
        let stateQuery = URLQueryItem(name: "state", value: state.lowercased())
        let jsonQuery = URLQueryItem(name: "output", value: "json")

        /// Create an instance of URLComponents with the baseURL, then attach the array of URLQueryItems to it.
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [stateQuery, jsonQuery]
        
        /// Using the .url property of your URLComponents, create a dataTask using URLSession using URLSession.
        /// Use the initializer with that takes in a URL, and has a completion closure. This is used to get Data back from the API.
        guard let requestURL = components?.url else { completion([]); return }
        
        /// Create the data task
        let dataTask = URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                print("Error getting representatives: \(error.localizedDescription)")
                completion([])
                return
            }
            guard let data = data,
                
                /// decode data into a string using .ascii, then reencode the string as data using .utf8
                let responseDataString = String(data: data, encoding: .ascii),
                let fixedData = responseDataString.data(using: .utf8)
                else { completion([]); return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                ///if the guard statement doesn't fail then use jsondecoder to decode the data as a dictionary [String: [Representative]]
                let resultsDictionary = try jsonDecoder.decode([String: [Representative]].self, from: fixedData)
                
                /// get the array of Represetatives using the resultsDictionary["results"]
                let repArray = resultsDictionary["results"]
                completion(repArray ?? [])
            } catch {
                print("error decoding json: \(error.localizedDescription)")
                completion([])
                return
            }
        }
        dataTask.resume()
        
    }
    
} // Class end

