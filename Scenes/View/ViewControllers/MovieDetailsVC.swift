//
//  MovieDetailsVC.swift
//  MoviesTask
//
//  Created by ahmed mostafa on 10/2/20.
//

import UIKit
import Kingfisher

protocol MovieInfo: class {
    func getMovieDetails(moviesDetailsArray: [Genre]?)
    func getMoviewName(name: String)
    func getMovieBackImg(path: String)
    func getMoviePoster(path: String)
    func getGener()
    func getTime(time: Int)
    func getReviews(reviews: Double)
    func getVoteCount(voteCount: Int)
    func getDate(date: String)
    func getOverview(overview: String)
    func getRecommendationMovies(recommendationArray: [RecommendationResult]?)
    func startAnimating()
    func hideAnimating()
}

class MovieDetailsVC: UIViewController {

    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var movieNameLb: UILabel!
    @IBOutlet weak var generMovieLb: UILabel!
    @IBOutlet weak var posterMoviewImg: UIImageView!
    @IBOutlet weak var backMovieImg: UIImageView!
    @IBOutlet weak var dateLb: UILabel!
    @IBOutlet weak var timeLb: UILabel!
    @IBOutlet weak var reviewsLb: UILabel!
    @IBOutlet weak var overviewTF: UITextView!
    @IBOutlet weak var recommendationCollection: UICollectionView!
    
    var movieDetailsArr = [Genre]()
    var movieGenerNames = [String]()
    var presenter: MovieDetailsPresenter!
    var voteCount: Int = 0
    var recommendationArr = [RecommendationResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.back.setBackgroundImage(#imageLiteral(resourceName: "arrow_pointt"), for: .normal)
        presenter = MovieDetailsPresenter(movieDetailsPrt: self)
        presenter.getMovieDetails()
        setupCollection()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MovieDetailsVC: MovieInfo {
    func getMovieBackImg(path: String) {
        self.backMovieImg.kf.indicatorType = .activity
        let url = URL(string: "http://image.tmdb.org/t/p/w185/\(path)")
        self.backMovieImg.kf.setImage(with: url as! Resource) 
    }
    func getMoviePoster(path: String) {
        self.posterMoviewImg.kf.indicatorType = .activity
        let url = URL(string: "http://image.tmdb.org/t/p/w185/\(path)")
        self.posterMoviewImg.kf.setImage(with: url)
    }
    func getMoviewName(name: String) {
        self.movieNameLb.text = name ?? ""
    }
    func getMovieDetails(moviesDetailsArray: [Genre]?) {
        self.movieDetailsArr = moviesDetailsArray ?? []
        for i in 0..<self.movieDetailsArr.count {
            self.movieGenerNames.append(movieDetailsArr[i].name)
        }
    }
    func getReviews(reviews: Double) {
        self.reviewsLb.text = "\(reviews) (\(voteCount) Reviews)" ?? ""
    }
    func getVoteCount(voteCount: Int) {
        self.voteCount = voteCount ?? 0
    }
    func getDate(date: String) {
        self.dateLb.text = "\(date) Released" ?? ""
    }
    func getGener() {
        //self.generMovieLb.text = "\(movieGenerNames[0]), \(movieGenerNames[1]))"
    }
    func getTime(time: Int) {
        self.timeLb.text = "\(time) mins" ?? ""
    }
    func getOverview(overview: String) {
        self.overviewTF.text = overview ?? ""
    }
    func getRecommendationMovies(recommendationArray: [RecommendationResult]?) {
        self.recommendationArr = recommendationArray ?? []
        self.recommendationCollection.reloadData()
    }
    func startAnimating() {
        self.showProgress()
    }
    func hideAnimating() {
        self.hideProgress()
    }
}
