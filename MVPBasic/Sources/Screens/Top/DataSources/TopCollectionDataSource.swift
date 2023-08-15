//
//  TopCollectionDataSource.swift
//  MVPBasic
//
//  Created by Nguyễn Đức Tân on 03/08/2023.
//

import UIKit

class TopCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    var photos: [PhotoViewEntity]
    
    init(photos: [PhotoViewEntity]) {
        self.photos = photos
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueCell(PhotoCollectionViewCell.self, forIndexPath: indexPath) else {
            return UICollectionViewCell()
        }
        cell.imageView.setImage(withPath: photos[indexPath.row].url)
        return cell
    }
}
