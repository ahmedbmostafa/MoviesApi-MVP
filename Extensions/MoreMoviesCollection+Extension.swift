//
//  MoreMoviesCollection+Extension.swift
//  MoviesTask
//
//  Created by ahmed mostafa on 10/3/20.
//

import UIKit

extension MoreMoviesVC: UICollectionViewDataSource{

    func setupCollection() {
        moreMoviesCollection.delegate = self
        moreMoviesCollection.dataSource = self
        moreMoviesCollection.showsVerticalScrollIndicator = false
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moreMoviesArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreMoviesCell", for: indexPath) as? MoreMoviesCell else {return MoreMoviesCell()}
            cell.movieImg.kf.indicatorType = .activity
            let path = moreMoviesArr[indexPath.row].posterPath
            let url = URL(string: "http://image.tmdb.org/t/p/w185/\(path)")
            cell.movieImg.kf.setImage(with: url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = Storyboard.Main.instantiate(MovieDetailsVC.self)
        movieID = moreMoviesArr[indexPath.row].id
        self.present(vc, animated: true, completion: nil)
    }
}
    
extension MoreMoviesVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((moreMoviesCollection.frame.width - 10) / 2), height: (moreMoviesCollection.frame.height) / 3)
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

