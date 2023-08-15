//
//  TopViewController.swift
//  MVPBasic
//
//  Created by Nguyễn Đức Tân on 03/08/2023.
//

import UIKit

class TopViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textField: UITextField!
    
    private var presenter: TopPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewType = .top
        presenter = TopPresenter(output: self)
        setupCollectionView()
        presenter?.didLoad()
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = true
        
        collectionView.delegate = self
        collectionView.dataSource = self.presenter?.dataSource
        
        let layout = BouncyLayout()
        collectionView.collectionViewLayout = layout
        collectionView.registerCellByNib(PhotoCollectionViewCell.self)
    }
}

extension TopViewController: TopPresenterOutput {
    func updatePhotos() {
        collectionView.reloadData()
    }
    
    func showLoading() {
        LoadingHud.show()
    }
    
    func hideLoading() {
        LoadingHud.hide()
    }
    
    func showError(_ error: String) {
    }
}

extension TopViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 15)/2, height: 120)
    }
}
