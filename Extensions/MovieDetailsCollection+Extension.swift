//
//  MovieDetailsCollection+Extension.swift
//  MoviesTask
//
//  Created by ahmed mostafa on 10/3/20.
//

import UIKit

extension MovieDetailsVC: UICollectionViewDataSource{

    func setupCollection() {
        recommendationCollection.delegate = self
        recommendationCollection.dataSource = self
        recommendationCollection.showsHorizontalScrollIndicator = false
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendationArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendationMoviesCell", for: indexPath) as? RecommendationMoviesCell else {return RecommendationMoviesCell()}
        presenter.setupRecommendationMoviesCell(cell: cell, indexPath: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = Storyboard.Main.instantiate(MovieDetailsVC.self)
        movieID = recommendationArr[indexPath.row].id
        self.present(vc, animated: true, completion: nil)
    }
}
    
extension MovieDetailsVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((recommendationCollection.frame.width) / 3), height: recommendationCollection.frame.height)
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

