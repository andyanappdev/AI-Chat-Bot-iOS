
import Foundation

protocol APIClientProtocol {
    associatedtype RequestType: Encodable
    associatedtype ResponseType: Decodable
    
    func sendRequest<T: Decodable>(_ request: RequestType, completion: @escaping (Result<T, Error>) -> Void)
}

class APIClient<Request: Encodable, Response: Decodable>: APIClientProtocol {
    
    typealias RequestType = Request
    typealias ResponseType = Response
    
    private let baseURL: URL
    private let apiKey: String
    
    init(baseURL: URL, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    
    func sendRequest<T: Decodable>(_ request: Request, completion: @escaping (Result<T, Error>) -> Void) {
        var urlRequest = URLRequest(url: baseURL)
        urlRequest.httpMethod = HTTPMethod.post.rawValue
        urlRequest.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            urlRequest.httpBody = try JSONEncoder().encode(request)
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
