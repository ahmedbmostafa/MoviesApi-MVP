//
//  HomeMoviesPresenter.swift
//  MoviesTask
//
//  Created by ahmed mostafa on 10/3/20.
//

import Foundation
import Kingfisher

class HomeMoviesPresenter: NSObject {
    
    weak var moviesPrt: MoviesProtocol!
    let api: LoadMoviesProtocol = UserAPI()
    var topRatedArr = [Result]()
    var popularArr = [Result]()
    var comingArr = [Result]()
    
    init(myMoviesPrt: MoviesProtocol) {
        self.moviesPrt = myMoviesPrt
    }
    
    // Mark: - setup moreRelated movies cell
    func setupMoreRelatedCell(cell: MoreTopMoviewCell, indexPath: IndexPath) {
        cell.topRelatedImage.kf.indicatorType = .activity
        let path = topRatedArr[indexPath.row].posterPath
        let url = URL(string: "http://image.tmdb.org/t/p/w185/\(path)")
        cell.topRelatedImage.kf.setImage(with: url)
    }
    // Mark: - setup popular movies cell
    func setupPopularMoviesCell(cell: PopularMoviesCell, indexPath: IndexPath) {
        cell.popularMovieImage.kf.indicatorType = .activity
        let path = popularArr[indexPath.row].posterPath
        let url = URL(string: "http://image.tmdb.org/t/p/w185/\(path)")
        cell.popularMovieImage.kf.setImage(with: url)
    }
    // Mark: - setup coming movies cell
    func setupComingMoviesCell(cell: ComingMoviesCell, indexPath: IndexPath) {
        cell.comingMovieImage.kf.indicatorType = .activity
        let path = comingArr[indexPath.row].posterPath
        let url = URL(string: "http://image.tmdb.org/t/p/w185/\(path)")
        cell.comingMovieImage.kf.setImage(with: url)
    }
    // Mark: Get Home Movies 
    func getMovies() {
        self.moviesPrt.startAnimating()
        // Mark: - get toprelated movies
        api.topRatedMovies { (result) in
            print(result)
            switch result {
            case .success(let response):
                self.moviesPrt.hideAnimating()
               // let status = response?.statusCode
                    self.moviesPrt.getTopRelatedArray(moviesArray: response?.results)
                    self.topRatedArr = response?.results ?? []
            case.failure(let error):
                print("Error")
            }
        }
        // Mark: - get popular movies
        api.popularMovies { (result) in
            print(result)
            switch result {
            case .success(let response):
                self.moviesPrt.hideAnimating()
                self.moviesPrt.getPopularArray(popularMoviesArray: response?.results)
                self.popularArr = response?.results ?? []
            case .failure(let error):
                print("Error")
            }
        }
        // Mark: - get toprelated movies
        api.comingMovies { (result) in
            print(result)
            switch result {
            case .success(let response):
                self.moviesPrt.hideAnimating()
                self.moviesPrt.getComingArray(comingMoviesArray: response?.results)
                self.comingArr = response?.results ?? []
            case .failure(let error):
                print("Error")
            }
        }
    }
}
