//
//  MoreMoviesVC.swift
//  MoviesTask
//
//  Created by ahmed mostafa on 10/3/20.
//

import UIKit

protocol MoreMoviesProtocol: class {
    func getMoreMovies(moreMoviesArray: [Result]?)
}

class MoreMoviesVC: UIViewController {

    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var moreMoviesCollection: UICollectionView!
    
    var moreMoviesArr = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        moreMoviesArr.removeAll()
        self.goback()
    }
    @IBAction func searchBtn(_ sender: Any) {
    }
}

extension MoreMoviesVC: MoreMoviesProtocol {
    func getMoreMovies(moreMoviesArray: [Result]?) {
        self.moreMoviesArr = moreMoviesArray ?? []
        self.moreMoviesCollection.reloadData()
    }
}
