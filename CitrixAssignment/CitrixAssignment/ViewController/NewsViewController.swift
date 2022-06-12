//
//  ViewController.swift
//  CitrixAssignment
//
//  Created by Stanly Johnson on 09/06/22.
//

import UIKit

class NewsViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.isHidden = true
        }
    }
    // MARK: - Injection
    let viewModel = NewsViewModel()
    
    // MARK: - Properties
    var popularNewsAPIUrl: String = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=ZEmaGpAvuNrmZFJ8qR1EhtOHkaBVzA2u"
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        viewModel.updateTableView = {
            self.tableView.isHidden = false
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        viewModel.callPopularNewsAPI(apiUrl: popularNewsAPIUrl) { isSuccess in
            if isSuccess {
                print("API call success")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationbar()
    }
    
    func registerNibs() {
        tableView.register(UINib(nibName: "PopularNewsTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "PopularNewsTableViewCell")
    }
    
    func setupNavigationbar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.isNavigationBarHidden = true
    }
    
    func navigateToNewsDetailsScreen(index: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController")
        as? NewsDetailViewController ?? NewsDetailViewController()
        let popularNews = viewModel.popularNewsDetails(at: index)
        let externalUrl = popularNews?.url
        viewController.externalURL = externalUrl
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension NewsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPopularNews()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularNewsTableViewCell", for: indexPath) as? PopularNewsTableViewCell
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        cell?.viewModel = self.viewModel
        cell?.configureUI(at: indexPath.row)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToNewsDetailsScreen(index: indexPath.row)
    }
    
}
