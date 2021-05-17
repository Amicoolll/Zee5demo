//
//  Imagedetail.swift
//  Zee5Demo
//
//  Created by Admin on 12/05/21.
//

import UIKit

class Imagedetail: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image : String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string: image)

        imageView?.kf.setImage(with: url, placeholder: UIImage(named: "images"), options: nil, progressBlock: nil, completionHandler: nil)
    }
}
