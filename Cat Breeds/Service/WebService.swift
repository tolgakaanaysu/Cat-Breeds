import Foundation

struct WebService {
    
}
extension WebService {
    
    func downloadData(urlString: String, completion: @escaping (Result<[CatsModel]?,DownloaderError>) -> Void) {
        let headers = ["x-api-key": "0b65917b-d41b-4cf2-8eae-0d70f1afcea2"]
        let request = NSMutableURLRequest(url: NSURL(string: urlString)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
        if let error = error {
            print(error.localizedDescription)
            completion(.failure(.badUrl))
        }
            
        guard let data = data, error == nil else {
            return completion(.failure(.noData))
        }
            
        guard let cats = try? JSONDecoder().decode([CatsModel].self, from: data) else {
            return completion(.failure(.dataParseError))
        }
            completion(.success(cats))
        }.resume()

        
    }
}

enum DownloaderError: Error {
    case badUrl
    case noData
    case dataParseError
}
