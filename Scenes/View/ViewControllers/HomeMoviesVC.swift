//
//  HomeMoviesVC.swift
//  MoviesTask
//
//  Created by ahmed mostafa on 10/2/20.
//

import UIKit

protocol MoviesProtocol: class {
    func getTopRelatedArray(moviesArray: [Result]?)
    func getPopularArray(popularMoviesArray: [Result]?)
    func getComingArray(comingMoviesArray: [Result]?)
    func startAnimating()
    func hideAnimating()
}

class HomeMoviesVC: UIViewController {

    @IBOutlet weak var moreTopMoviewsTapped: UIView!
    @IBOutlet weak var morePopularMoviesTapped: UIView!
    @IBOutlet weak var moreComingMoviesTapped: UIView!
    @IBOutlet weak var nowPlayingTapped: UIView!
    @IBOutlet weak var topRelatedCollection: UICollectionView!
    @IBOutlet weak var popularCollection: UICollectionView!
    @IBOutlet weak var comingCollection: UICollectionView!
    @IBOutlet weak var noTopMoviesFound: UILabel!
    @IBOutlet weak var noComingFound: UILabel!
    @IBOutlet weak var noPopularFound: UILabel!
    
    var presenter: HomeMoviesPresenter!
    var topRatedMoviesArr = [Result]()
    var popularMoviesArr = [Result]()
    var comingMoviesArr = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = HomeMoviesPresenter(myMoviesPrt: self)
        presenter.getMovies()
        setupCollection()
        tapGesture()
    }
    
    // Mark: - func of UITapGesture of view
    func tapGesture() {
      
        let moreTopTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToMoreTop))
        self.moreTopMoviewsTapped.addGestureRecognizer(moreTopTapGesture)
        
        let morePopularTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToPopular))
        self.morePopularMoviesTapped.addGestureRecognizer(morePopularTapGesture)
        
        let moreComingTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToUpcoming))
        self.moreComingMoviesTapped.addGestureRecognizer(moreComingTapGesture)
    }
    
    @objc func goToMoreTop() {
        let vc = Storyboard.Main.instantiate(MoreMoviesVC.self)
        vc.moreMoviesArr = topRatedMoviesArr ?? []
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func goToPopular() {
        let vc = Storyboard.Main.instantiate(MoreMoviesVC.self)
        vc.moreMoviesArr = popularMoviesArr ?? []
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func goToUpcoming() {
        let vc = Storyboard.Main.instantiate(MoreMoviesVC.self)
        vc.moreMoviesArr = comingMoviesArr ?? []
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeMoviesVC: MoviesProtocol {
    func getPopularArray(popularMoviesArray: [Result]?) {
        self.popularMoviesArr = popularMoviesArray ?? []
        self.popularCollection.reloadData()
    }
    func getComingArray(comingMoviesArray: [Result]?) {
        self.comingMoviesArr = comingMoviesArray ?? []
        self.comingCollection.reloadData()
    }
    func getTopRelatedArray(moviesArray: [Result]?) {
        self.topRatedMoviesArr = moviesArray ?? []
        self.topRelatedCollection.reloadData()
    }
    func startAnimating() {
        self.showProgress()
    }
    func hideAnimating() {
        self.hideProgress()
    }
}
