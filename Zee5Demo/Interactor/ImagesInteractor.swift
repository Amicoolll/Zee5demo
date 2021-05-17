//
//  ImagesInteractor.swift
//  Zee5Demo
//
//  Created by Admin on 12/05/21.
//

import Foundation
import RxAlamofire
import Alamofire
import RxSwift



class ImagesInteractor: PresenterToInteractorProtocol{
    
    var presenter: InteractorToPresenterProtocol?

    let disposeBag = DisposeBag()

    func fetchImages(txt: String) {
        
        let URL = "https://en.wikipedia.org/w/api.php?%20action=query&prop=pageimages&format=json&piprop=thumbnail&pithumbsize=640&pilimit=50&generator=prefixsearch&gpssearch=\(txt)"
                
                RxAlamofire.requestData(.get, URL)
                    .debug()
                    .subscribe(onNext: { (r, data) in
                        
                        let content = try? JSONDecoder().decode(ImagesModel.self, from: data)

                        print(content!.query.pages.values)
                        self.presenter?.imagesFetchedSuccess(noticeModelArray:content!)
                    
                    },  onError: { [weak self] (error) in
                        self?.presenter?.imagesFetchFailed()
                })
                    .disposed(by: disposeBag)        
    }
    
    
}

