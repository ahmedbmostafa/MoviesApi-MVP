//
//  Base.swift
//  MoviesTask
//
//  Created by ahmed mostafa on 10/3/20.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {
    
    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completion: @escaping(Swift.Result<M?, NSError>) -> Void) {
        
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)!
        let parameters = buildParameters(task: target.task)
        Alamofire.request(target.base + target.path, method: method, parameters: parameters.0, encoding: parameters.1).responseJSON {(response) in
            print("😳==URl==\(target.base + target.path) 💁🏻‍♀️==params==\(parameters)")
            do {
                let responseOBj = try? JSONDecoder().decode(M.self, from: response.data!)
                print("MYDATA = \(responseOBj)")
                completion(.success(responseOBj))
            }
            catch {
                let failResponseOBj = try? JSONDecoder().decode(M.self, from: response.data!)
                print("MYDATA = \(failResponseOBj)")
                completion(.failure(NSError()))
            }
        }
    }
}

func buildParameters(task: Task) ->([String: Any], ParameterEncoding) {
    switch task {
    case.requestPlain:
        return ([:], URLEncoding.default)
    case.requestParameters(parameters: let parameters, encoding: let encoding):
        return(parameters, encoding)
    }
}

