//
//  ViewController.swift
//  TableView
//
//  Created by Jaesuk Lee on 2023/09/10.
//

import UIKit

class ViewController: UIViewController {

    
//    var moviesArray: [Movie] = []
    var movieDataManager = DataManager()
 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.rowHeight = 120
        movieDataManager.makeMovieData()
        
    }

}


extension ViewController: UITableViewDataSource {
    // return how many contents on rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return movieDataManager.getMovieData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        // dequeueReusableCell = 기존에 만들어 놨던 cell 사용
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        // method 1
//        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
//        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
//        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
        
        let array = movieDataManager.getMovieData()
        let movie = array[indexPath.row]
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        
        return cell
    }
    
}
