//
//  APIHelper.swift
//  CodingChallenge
//  Created by Don Wettasinghe on 04/25/23.


import Foundation

typealias FetchCharacterCompletionHandler = (DuckDuckGoResponse?, APIError?) -> Void
typealias FetchDataCompletionHandler = (Data?, URLResponse?, Error?) -> Void

class APIHelper {
    // Singletons
    static let shared = APIHelper()
    
    private init() {}
    
    /**
     Fetches Characters from the API Url. Depending on the Scheme thats running this can be either a URL for Simpsons Characters Viewer Or The Wire Character Viewer
     
     - Parameter completionHandler: This Completion Handler will be called when the request has been completed.
     
     -  The Completion Handler will contain an Object of `DuckDuckGoResponse` unless there was error with the request in this case it will return an `Error`
     */
    func fetchCharacters(completionHandler: @escaping FetchCharacterCompletionHandler) {
        guard let url = URL(string: AppConfiguration.apiURL) else { return completionHandler(nil, .incorrectURL) }
        
        self.fetchData(from: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else { return completionHandler(nil, .responseError) }
            
            do {
                let fetchedData = try JSONDecoder().decode(DuckDuckGoResponse.self, from: dataResponse)
                completionHandler(fetchedData, nil)
            } catch {
                return completionHandler(nil, .parsingJSONError)
            }
        }
    }
    
    /**
     This function is used to get data from the provided `URL`.
     
     - Parameter url: The `URL` of the API.
     - Parameter completion: The completion handler to call when the load request is complete.
     */
    func fetchData(from url: URL, completion: @escaping FetchDataCompletionHandler) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
