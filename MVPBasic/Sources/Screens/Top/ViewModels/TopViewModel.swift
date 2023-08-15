//
//  TopViewModel.swift
//  MVPBasic
//
//  Created by Nguyễn Đức Tân on 03/08/2023.
//

import Foundation

protocol TopPresenterInput {
    var dataSource: TopCollectionDataSource { get }
    func didLoad()
}

protocol TopPresenterOutput {
    func updatePhotos()
    func showLoading()
    func hideLoading()
    func showError(_ error: String)
}

class TopPresenter: TopPresenterInput {
    var dataSource = TopCollectionDataSource(photos: [])
    
    var output: TopPresenterOutput
    
    init(output: TopPresenterOutput) {
        self.output = output
    }
    
    func didLoad() {
        getData()
    }
    
    private func getData() {
        output.showLoading()
        PhotoApi(.getListPhoto).send { [weak self] photos, error in
            self?.output.hideLoading()
            if let error = error {
                self?.output.showError(error.localizedDescription)
            } else {
                self?.dataSource.photos = photos ?? []
                self?.output.updatePhotos()
            }
        }
    }
}
