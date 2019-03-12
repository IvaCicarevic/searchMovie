//
//  ViewController.swift
//  omdbApiSEARCH
//
//  Created by Iva Cicarevic on 2/21/19.
//  Copyright © 2019 Iva Cicarevic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var movie: SearchMovie?
    
    @IBOutlet weak var searchWord: UITextField!
    @IBOutlet weak var table: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        table.backgroundColor = .gray
        table.dataSource = self
    }
    
    
    @IBAction func search(_ sender: Any) {
      
            getSearch()
            table.reloadData()
    }
    
    
    
    func getSearch() {
        if let url = URL(string: "http://www.omdbapi.com/?s=" + searchWord.text! + "&plot=full&apikey=956702e8") {
            
            
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                
                
                if let m = try? decoder.decode(SearchMovie.self, from: data) {
                    self.movie = m
                    print(self.movie!)
                    
                    DispatchQueue.main.async {
                        self.table.reloadData()
                        }
                    }
                }
            }.resume()
        } else {
            print("error")
        }
    }

    
    
    @IBAction func newSearch(_ sender: Any) {
        searchWord.text = ""
       
    }
}


extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if movie == nil {
            return 0
        } else {
            return movie!.Search.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DataCell
        
        if movie != nil {
            cell.title.text = movie?.Search[indexPath.row].Title
            cell.imdbID.text = "imdbID: \(movie!.Search[indexPath.row].imdbID)"
            cell.year.text = "year: \(movie!.Search[indexPath.row].Year)"
            
        
            if let imageUrl  = movie?.Search[indexPath.row].Poster {
                let url = URL(string: imageUrl)
                let dataTask = URLSession.shared.dataTask(with: url!) {
                (data, response, error) in
                
                
                DispatchQueue.main.async {
                    cell.poster.image = UIImage(data: data!)
                }
            }
            dataTask.resume()
            return cell
        } else {
            print("error")
            }
        }
        return cell
    }
}
