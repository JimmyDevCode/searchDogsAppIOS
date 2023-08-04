//
//  ViewController.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 1/08/23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    
    func updateDataDogs(dogs: [DogMapperResponse])
    func updateDataDogsFiltered(dogs: [DogMapperResponse])
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableViewDog: UITableView!
    
    
    
    
    private var listDogs: [DogMapperResponse] = [] {
        didSet{
            tableViewDog.reloadData()
        }
    }
    
    
    private var isLoadingData = false //
    var listDogsFiltered: [DogMapperResponse] = []
    var textNameSearchDog = ""
    
    private var currentPage: Int = 0 {
        
        didSet{
            self.presenter?.getDogs(page: currentPage)
        }
    }
    
    private var currentItemCount = 0
    
    var presenter: HomePresenterInputProtocol?
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //customize title navigation bar
        customizeNavigationBar()
        
        //implement factory
        HomeConfigurator.createModuleHome(view: self)
        
        tableViewDog.delegate = self
        tableViewDog.dataSource = self
        presenter?.getDogs(page: currentPage)
        
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func updateDataDogs(dogs: [DogMapperResponse]) {
        currentItemCount = dogs.count
        listDogs = dogs
        hideLoading()
    }
    
    func updateDataDogsFiltered(dogs: [DogMapperResponse]) {
        listDogs = dogs
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCellDog", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let dog = listDogs[indexPath.row]
        cell.setup(dog: dog)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dog = listDogs[indexPath.row]
        presenter?.selectDog(dog: dog)
    }
}

extension HomeViewController{
    
    func customizeNavigationBar() {
        //personalize navigationBar title
        let titleLabel = UILabel()
        titleLabel.text = "As is your dog?"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        titleLabel.textColor = .black
        titleLabel.sizeToFit()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchDogs(text: searchText)
        
    }
}

extension HomeViewController{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeight = scrollView.frame.size.height
        let scrollContentSizeHeight = scrollView.contentSize.height
        let scrollOffset = scrollView.contentOffset.y
        
        if scrollOffset + scrollViewHeight >= scrollContentSizeHeight - 50 {
            // Check if the load indicator is already displayed, to avoid displaying it several times.
            if tableViewDog.tableFooterView == nil && !isLoadingData{
                isLoadingData = true
                showLoading()
                currentPage += 1
               
            }
            
        }
    }
}

extension HomeViewController{
    
    func showLoading(){
        if tableViewDog.tableFooterView  == nil{
            // Create a new view for the load indicator
            let loadingView = UIView(frame: CGRect(x: 0, y: 0, width: tableViewDog.frame.width, height: 50))
            let activityIndicator = UIActivityIndicatorView(style: .medium)
            loadingView.addSubview(activityIndicator)
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            
            // Align the load indicator in the lower part of the view
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
                activityIndicator.bottomAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: -8) // Adjusts the value for changing the vertical position
            ])
            
            activityIndicator.startAnimating()
            
            // Assign the load indicator view to the table as footer
            tableViewDog.tableFooterView = loadingView
            tableViewDog.tableFooterView?.isHidden = false
        }
        
    }
    
    func hideLoading(){
        isLoadingData = false
        tableViewDog.tableFooterView = nil
        // Add a 1.5-second pause before hiding the load indicator
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.tableViewDog.tableFooterView = nil
        }
    }
}
