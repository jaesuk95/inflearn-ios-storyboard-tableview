//
//  ViewController.swift
//  TableView
//
//  Created by Jaesuk Lee on 2023/09/10.
//

import UIKit

class ViewController: UIViewController {

    
    var moviesArray: [Movie] = []
    var movieDataManager = DataManager()
 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "영화목록"
        
        setupTableView()
        setupDatas()
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        print(#function)
        movieDataManager.updateMovieData()
        moviesArray = movieDataManager.getMovieData()  // 다시 데이터 받아서 뷰컨의 배열에 저장
        tableView.reloadData()
    }
    
    func setupTableView() {
        // 델리게이트 패턴의 대리자 설정
        tableView.dataSource = self
        tableView.delegate = self
        // 셀의 높이 설정
        tableView.rowHeight = 120
    }
    
    func setupDatas() {
        movieDataManager.makeMovieData() // 일반적으로는 서버에 요청
        moviesArray = movieDataManager.getMovieData()  // 데이터 받아서 뷰컨의 배열에 저장
    }
}


extension ViewController: UITableViewDataSource {
    // return how many contents on rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        // dequeueReusableCell = 기존에 만들어 놨던 cell 사용
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        // method 1
//        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
//        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
//        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
        
        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
        cell.selectionStyle = .none
        
        return cell
    }
    
}


extension ViewController: UITableViewDelegate {
    // to pass the tableView's data to next page, you would need this code underneath
    // to pass data to next page
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 세그웨이를 실행
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    // prepare세그웨이(데이터 전달) // 이건 그냥 외워라
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            let index = sender as! IndexPath
            
            // 배열에서 아이템을 꺼내서, 다음화면으로 전달
            detailVC.movieData = moviesArray[index.row]
        }
    }
}
