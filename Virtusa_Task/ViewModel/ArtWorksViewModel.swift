//
//  ArtWorksViewModel.swift
//  Virtusa_Task
//
//  Created by Apple on 29/01/24.
//

import Foundation
import UIKit

class ArtWorksViewModel {
    
    var networkManger = NetworkManger()
    var artWorksObj = ArtWorksModel()
    
    
    init(network: NetworkManger) {
        self.networkManger = network
    }
    
    //MARK: Get ArtWork XibNib Method
    func getArtWorkXibNibMethod(tableView: UITableView)  {
        let artWorkXibNib = UINib(nibName: TableViewIdentifiers.ArtWorksTableViewCell, bundle: nil)
        tableView.register(artWorkXibNib, forCellReuseIdentifier: TableViewIdentifiers.ArtWorksTableViewCell)
    }
    
    //MARK: Get ArtWork Details From Server Method
    func getArtWorksDetailsFromServerMethod(url: String, sucess: @escaping (Bool) -> ())  {
        networkManger.getDataFromServerMethod(urlStr: url, params: [:]) { responseData in
            DispatchQueue.main.async {
            self.artWorksObj = responseData
            sucess(true)
            }
        } failure: { error in
            
        }

    }
    
    //MARK: Load Activity Indicator
    func activityIndicator(style: UIActivityIndicatorView.Style = .medium,
                                       frame: CGRect? = nil,
                                       center: CGPoint? = nil) -> UIActivityIndicatorView {
        
        let activityIndicatorView = UIActivityIndicatorView(style: style)
        if let frame = frame {
            activityIndicatorView.frame = frame
        }
        if let center = center {
            activityIndicatorView.center = center
        }
        return activityIndicatorView
    }
}
