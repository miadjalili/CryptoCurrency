//
//  APIRouter.swift
//  CryptoCurrency
//
//  Created by miadjalili on 10/23/21.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case Coins(currency: String)
    
   
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case  .Coins:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .Coins:
            return "/coins"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .Coins(let currency):
            return [API.APIParameterKey.currency: currency]
        default:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try API.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
 
        // Parameters
        if let parameters = parameters {
            do {
                if method == .get {
                    urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                }else{
                
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                }
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
