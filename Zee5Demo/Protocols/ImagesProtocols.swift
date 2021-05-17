//
//  ImagesProtocols.swift
//  Zee5Demo
//
//  Created by Admin on 13/05/21.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocols : class {
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingImages(txt: String)
}

protocol PresenterToViewProtocol: class{
    func showImages(images:ImagesModel)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> SearchImages
//    func pushToImageDetail(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchImages(txt: String)
}

protocol InteractorToPresenterProtocol: class {
    func imagesFetchedSuccess(noticeModelArray:ImagesModel)
    func imagesFetchFailed()
}
