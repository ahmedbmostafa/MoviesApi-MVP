//
//  UserAPI.swift
//  MoviesTask
//
//  Created by ahmed mostafa on 10/3/20.
//

import Foundation
import Alamofire

var movieID: Int = 0

enum UserNetworking {
    case getTopMovies
    case getPopularMovies
    case getComingMovies
    case getMovieDetails
    case recommendationMovies
}



extension UserNetworking: TargetType {
    var base: String {
        switch self {
            default:
            return "https://api.themoviedb.org/3"
        }
    }
    
    var path: String {
        switch self {
        case .getTopMovies:
            let apiKey = "dd4405e313cf270c0361a43c8b86825a"
            return "/movie/top_rated?api_key=\(apiKey)"
        case .getPopularMovies:
            let apiKey = "dd4405e313cf270c0361a43c8b86825a"
            return "/movie/popular?api_key=\(apiKey)"
        case .getComingMovies:
            let apiKey = "dd4405e313cf270c0361a43c8b86825a"
            return "/movie/upcoming?api_key=\(apiKey)"
        case .getMovieDetails:
            let apiKey = "dd4405e313cf270c0361a43c8b86825a"
            let movieId = movieID
            return "/movie/\(movieId)?api_key=\(apiKey)"
        case .recommendationMovies:
          //  let apiKey = "dd4405e313cf270c0361a43c8b86825a"
           // let movieId = movieID
            return "/movie/694919/recommendations?api_key=dd4405e313cf270c0361a43c8b86825a&language=en-US&page=1"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getTopMovies:
            return .get
        case .getPopularMovies:
            return .get
        case .getComingMovies:
            return .get
        case .getMovieDetails:
            return .get
        case .recommendationMovies:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getTopMovies:
            return .requestPlain
        case .getPopularMovies:
            return .requestPlain
        case .getComingMovies:
            return .requestPlain
        case .getMovieDetails:
            return .requestPlain
        case .recommendationMovies:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}
