//
//  ImagesPresenter.swift
//  Zee5Demo
//
//  Created by Admin on 13/05/21.
//

import UIKit
import Foundation


class ImagesPresenter: ViewToPresenterProtocols{
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingImages(txt: String) {
        
        interactor?.fetchImages(txt: txt)
    }
    
    func showImageDetail(navigationController: UINavigationController) {
    }
}

extension ImagesPresenter: InteractorToPresenterProtocol{
    func imagesFetchedSuccess(noticeModelArray: ImagesModel) {
        
        view?.showImages(images: noticeModelArray)
    }
    func imagesFetchFailed() {
        
        view?.showError()
    }
    
}
