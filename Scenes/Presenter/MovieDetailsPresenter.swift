//
//  MovieDetailsPresenter.swift
//  MoviesTask
//
//  Created by ahmed mostafa on 10/3/20.
//

import Foundation
import Kingfisher

class MovieDetailsPresenter: NSObject {
    
    weak var movieInfoPrt: MovieInfo!
    let api: LoadMoviesProtocol = UserAPI()
    var movieDetailsArr = [MovieDetails]()
    var recommendationArr = [RecommendationResult]()
    
    init(movieDetailsPrt: MovieInfo) {
        self.movieInfoPrt = movieDetailsPrt
    }
        // Mark: - setup recommendation movies cell
    func setupRecommendationMoviesCell(cell: RecommendationMoviesCell, indexPath: IndexPath) {
        cell.recommendationMovieImg.kf.indicatorType = .activity
        let path = recommendationArr[indexPath.row].posterPath
        let url = URL(string: "http://image.tmdb.org/t/p/w185/\(path)")
        cell.recommendationMovieImg.kf.setImage(with: url)
    }
    
    func getMovieDetails() {
        self.movieInfoPrt.startAnimating()
        api.movieDetails { (result) in
            print(result)
            switch result {
            case .success(let response):
                self.movieInfoPrt.hideAnimating()
                let pathBackImg = response?.backdropPath ?? ""
                movieID = response?.id ?? 0
                self.movieInfoPrt.getMovieBackImg(path: pathBackImg)
                let pathPosterImg = response?.posterPath ?? ""
                self.movieInfoPrt.getMoviePoster(path: pathPosterImg)
                self.movieInfoPrt.getMoviewName(name: response?.title ?? "")
                self.movieInfoPrt.getDate(date: response?.releaseDate ?? "")
                self.movieInfoPrt.getOverview(overview: response?.overview ?? "")
                self.movieInfoPrt.getTime(time: response?.runtime ?? 0)
                self.movieInfoPrt.getVoteCount(voteCount: response?.voteCount ?? 0)
                self.movieInfoPrt.getReviews(reviews: response?.voteAverage ?? 0.0)
                self.movieInfoPrt.getMovieDetails(moviesDetailsArray: response?.genres ?? [])
            case.failure(let error):
                print("Error")
            }
        }
        
        api.recommendationMovies { (result) in
            self.movieInfoPrt.startAnimating()
            print(result)
            switch result {
            case .success(let response):
                self.movieInfoPrt.hideAnimating()
                self.movieInfoPrt.getRecommendationMovies(recommendationArray: response?.results)
                self.recommendationArr = response?.results ?? []
            case .failure(let error):
                print("Error")
            }
        }
    }
}
