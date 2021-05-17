//
//  ImageRouter.swift
//  Zee5Demo
//
//  Created by Admin on 13/05/21.
//

import Foundation
import  UIKit



class ImagesRouter:PresenterToRouterProtocol{


    static func createModule() -> SearchImages {

        let view = mainstoryboard.instantiateViewController(withIdentifier: "SearchImages") as! SearchImages
        let presenter: ViewToPresenterProtocols & InteractorToPresenterProtocol = ImagesPresenter()
        let interactor: PresenterToInteractorProtocol = ImagesInteractor()
        let router:PresenterToRouterProtocol = ImagesRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
    
    static var mainstoryboard: UIStoryboard{

        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }

}
