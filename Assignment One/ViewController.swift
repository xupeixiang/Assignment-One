//
//  ViewController.swift
//  Assignment One
//
//  Created by Peixiang on 2023/1/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var citiesTableView: UITableView!
    
    struct Constants {
        static let cellIndentifer = "CityIndentifer"
    }
    
    let cities: [String] = ["Beijing", "Shanghai", "Tokyo", "Hongkong", "London","Paris", "Berlin",
                  "Vienna", "Moscow", "New York"]
    let countries: [String: String] = ["Beijing": "China", "Shanghai": "China", "Tokyo": "Japan",
                  "Hongkong": "China", "London": "UK","Paris": "France", "Berlin": "Germany",
                  "Vienna": "Austria", "Moscow": "Russia", "New York": "USA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        citiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIndentifer)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIndentifer, for: indexPath)
        var cellConfig = tableViewCell.defaultContentConfiguration()
        let cityNanme = cities[indexPath.row]
        
        cellConfig.text = cityNanme
        cellConfig.secondaryText = countries[cityNanme] ?? ""
        tableViewCell.contentConfiguration = cellConfig
        
        return tableViewCell
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityNanme = cities[indexPath.row]
        
        print("User tapped on \(cityNanme) in \(countries[cityNanme] ?? "")")
        citiesTableView.deselectRow(at: indexPath, animated: true)
    }
}
