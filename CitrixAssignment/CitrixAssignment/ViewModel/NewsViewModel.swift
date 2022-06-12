//
//  NewsViewModel.swift
//  CitrixAssignment
//
//  Created by Stanly Johnson on 10/06/22.
//

import Foundation
class NewsViewModel {
    
    /// Tableview gets refreshed everytime value set to this varaible through updateTableView closure
    private var popularNewsModel: PopularNews? {
        didSet {
            self.updateTableView?()
        }
    }
    //MARK:- call back blocks
    var updateTableView: (()->Void)?
    
    /// Returns the total number of news
    func numberOfPopularNews() -> Int {
        return popularNewsModel?.results?.count ?? 0
    }

    /// Returns the news detailst at a given index
    /// - Parameter index: Indexpath of the tableview
    func popularNewsDetails(at index: Int) -> Results? {
        return popularNewsModel?.results?[index]
    }
    
    func callPopularNewsAPI(apiUrl: String,_ completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: apiUrl) else {
            completion(false)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            do {
            let responseModel = try jsonDecoder.decode(PopularNews.self, from: data!)
                print(responseModel)
                self.popularNewsModel = responseModel
                completion(true)
            } catch {
                completion(false)
                print("error")
            }

        }
        task.resume()
    }
}
