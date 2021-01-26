//
//  HomeCollections+Extensions.swift
//  MoviesTask
//
//  Created by ahmed mostafa on 10/2/20.
//

import UIKit

extension HomeMoviesVC: UICollectionViewDataSource {
    
    func setupCollection() {
        topRelatedCollection.tag = 0
        popularCollection.tag = 1
        comingCollection.tag = 2
        topRelatedCollection.delegate = self
        topRelatedCollection.dataSource = self
        popularCollection.showsHorizontalScrollIndicator = false
        popularCollection.delegate = self
        popularCollection.dataSource = self
        topRelatedCollection.showsHorizontalScrollIndicator = false
        comingCollection.delegate = self
        comingCollection.dataSource = self
        comingCollection.showsHorizontalScrollIndicator = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 0 {
            return topRatedMoviesArr.count
        }
        else if collectionView.tag == 1 {
            return popularMoviesArr.count
        }
        else {
            return comingMoviesArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreTopMoviewCell", for: indexPath) as? MoreTopMoviewCell else { return MoreTopMoviewCell()}
            presenter.setupMoreRelatedCell(cell: cell, indexPath: indexPath)
            return cell
        }
        else if collectionView.tag == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularMoviesCell", for: indexPath) as? PopularMoviesCell else { return PopularMoviesCell()}
            presenter.setupPopularMoviesCell(cell: cell, indexPath: indexPath)
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComingMoviesCell", for: indexPath) as? ComingMoviesCell else { return ComingMoviesCell()}
            presenter.setupComingMoviesCell(cell: cell, indexPath: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            let vc = Storyboard.Main.instantiate(MovieDetailsVC.self)
            movieID = topRatedMoviesArr[indexPath.row].id
            self.present(vc, animated: true, completion: nil)
        }
        else if collectionView.tag == 1 {
            let vc = Storyboard.Main.instantiate(MovieDetailsVC.self)
            movieID = popularMoviesArr[indexPath.row].id
            self.present(vc, animated: true, completion: nil)
        }
        else {
            let vc = Storyboard.Main.instantiate(MovieDetailsVC.self)
            movieID = comingMoviesArr[indexPath.row].id
            self.present(vc, animated: true, completion: nil)
        }
    }
}

extension HomeMoviesVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 0 {
            return CGSize(width: ((topRelatedCollection.frame.width) / 3.5), height: (topRelatedCollection.frame.height))
        }
        else if collectionView.tag == 1 {
            return CGSize(width: ((popularCollection.frame.width) / 3.5), height: (popularCollection.frame.height))
        }
        else {
            return CGSize(width: ((comingCollection.frame.width) / 3.5), height: (comingCollection.frame.height))
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView.tag == 0 {
            return 10
        }
        else if collectionView.tag == 1 {
            return 10
        }
        else {
            return 10
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView.tag == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        else if collectionView.tag == 1 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}
