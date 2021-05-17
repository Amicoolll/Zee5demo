# Zee5demo

In this Project I have used the Wikipedia APIs to search the images and show them.

Viper: 

I have used Viper Architecture to make this project 

ImagesProtocol: Managing all the protocols.

View: The View is the user interface. This corresponds to a SwiftUI View. SearhImages
ImageDetail

ImageInteractor: The Interactor is a class that mediates between the presenter and the data. It takes direction from the presenter.

ImagesPresenter: The Presenter is the “traffic cop” of the architecture, directing data between the view and interactor, taking user actions and calling to router to move the user between views.

ImagesModel: An Entity represents application data.

ImagesModel: The Router handles navigation between screens. That’s different than it is in SwiftUI, where the view shows any new views.


Rx Alamofire: Used RxAlamofire to fetch the APIs 

Kingfisher: Used kingfisher library to download the images to show
