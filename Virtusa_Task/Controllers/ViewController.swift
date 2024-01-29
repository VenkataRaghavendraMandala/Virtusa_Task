//
//  ViewController.swift
//  Virtusa_Task
//
//  Created by Apple on 29/01/24.
//

import UIKit

class ViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var artworksTableView: UITableView!
    
    //MARK: Variables
    var networkManager = NetworkManger()
    var artWorksViewModel = ArtWorksViewModel(network: NetworkManger())
    var activityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        activityIndicatorView = self.artWorksViewModel.activityIndicator(style: .large,
                                                       center: self.view.center)
        self.view.addSubview(activityIndicatorView)
        self.artWorksViewModel.getArtWorkXibNibMethod(tableView: self.artworksTableView)
        self.getArtWorkDetails()
    }
    
    //MARK: Get ArtWork Details Method
    func getArtWorkDetails()  {
        self.activityIndicatorView.startAnimating()
        self.artWorksViewModel.getArtWorksDetailsFromServerMethod(url: AppUrl.ArtWork) { result in
            self.activityIndicatorView.stopAnimating()
            if result == true {
                DispatchQueue.main.async {
                    self.artworksTableView.dataSource = self
                    self.artworksTableView.delegate = self
                    self.artworksTableView.reloadData()
                }
            }
        }
    }
}

//MARK: UITableview DataSource and Delegate Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.artWorksViewModel.artWorksObj.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let artworksCell = self.artworksTableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.ArtWorksTableViewCell, for: indexPath) as? ArtWorksTableViewCell else {
            return UITableViewCell()
        }
        let artWorksObj = self.artWorksViewModel.artWorksObj.data?[indexPath.row]
        artworksCell.bindArtworksDetails(data: artWorksObj ?? Data())
        artworksCell.selectionStyle = .none
        return artworksCell
        
    }
}
