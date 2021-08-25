//
//  ViewController.swift
//  MVC
//
//  Created by Binal on 24/08/2021.
//

import UIKit

class MoviesListViewController: UIViewController {
    
   private let networkManager = NetworkManager()
    private var movies = [Movie]()

    @IBOutlet private weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovies()
        
        tableView.dataSource = self
    }
    
    private func fetchMovies(){
        let urlS = "https://api.themoviedb.org/3/movie/popular?api_key=01fd812f917a955c75e8fcf4d8278bbb&language=en-US"
     
        networkManager.getMovies(from: urlS) { [weak self]result in
            switch result {
            
            case .success(let movies):
                self?.movies = movies
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
            
        }
    }
extension MoviesListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell
        else { return UITableViewCell() }
        
        let row = indexPath.row
        let movie = movies[row]
        cell.configureCell(title: movie.originalTitle, overview: movie.overview, imageData: nil)
        
        return cell
    }
}
extension MoviesListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}






