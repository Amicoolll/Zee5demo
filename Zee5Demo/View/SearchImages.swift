//
//  searchImages.swift
//  Zee5Demo
//
//  Created by Admin on 12/05/21.
//

import UIKit
import Kingfisher

class SearchImages: UITableViewController {
   
    @IBOutlet var siTableView: UITableView!
    
    var presenter: ViewToPresenterProtocols?
    var imgModel:[Page] = []
    private let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    //    MARK: Initial Setup
    func initialSetup(){
        view.backgroundColor = .white
        setupSearchController()
        navigationBar()
        setupTableView()
    }
    
    //    MARK: Private Methods
    private func setupSearchController() {

        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Images"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.delegate = self

    }
    
    private func navigationBar(){
        navigationItem.title = "Search Images"
    }
    
    private func setupTableView() {
        siTableView.dataSource = self
        siTableView.delegate = self
    }
       // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imgModel.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tbCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cell

        guard let thumbnail = imgModel[indexPath.row].thumbnail else {
            
            return tbCell
        }
         let url = URL(string: thumbnail.source)
        
        tbCell.cellImage?.kf.setImage(with: url, placeholder: UIImage(named: "images"), options: nil, progressBlock: nil, completionHandler: nil)

        return tbCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let thumbnail = imgModel[indexPath.row].thumbnail else {

               return
        }
        

      let imgDetail =  ImagesRouter.mainstoryboard.instantiateViewController(withIdentifier: "Imagedetail") as! Imagedetail
        
        imgDetail.image = thumbnail.source
        self.navigationController?.pushViewController(imgDetail, animated: true)
        
    }
}

extension SearchImages: PresenterToViewProtocol{

    func showImages(images: ImagesModel) {
        
        for val in images.query.pages.values{
            
            if let _ = val.thumbnail{
                imgModel.append(val)
            }
            
        }
        siTableView.reloadData()
    }
    
    func showError() {
        
    }
}

//    MARK: UISearchbar Delegate
extension SearchImages: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            return
        }
        
        presenter?.startFetchingImages(txt: searchText)

    }
}




class cell : UITableViewCell{
    
    @IBOutlet weak var cellImage: UIImageView!
    
    
    override func prepareForReuse() {
        
        cellImage.image = nil
    }
}
