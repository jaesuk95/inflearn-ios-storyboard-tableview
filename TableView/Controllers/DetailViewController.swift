//
//  DetailViewController.swift
//  TableView
//
//  Created by Jaesuk Lee on 2023/09/16.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var dscriptionLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    var movieData: Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        mainImageView.image = movieData?.movieImage
        movieNameLabel.text = movieData?.movieName
        dscriptionLabel.text = movieData?.movieDescription
    }

    

}
