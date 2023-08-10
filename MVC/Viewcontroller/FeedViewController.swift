

import UIKit



class FeedViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var segmentControll: UISegmentedControl!
    
    @IBOutlet weak var tblUserData: UITableView!
    
    var userData = [PersonDetails]()
    
    var filteredData = [PersonDetails]()
    
    var searchedData = [PersonDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblUserData.dataSource = self
        self.tblUserData.delegate = self
        APIManager.shared.callAPI { userData in
            self.userData = userData
            self.searchedData = userData
            self.filteredData = userData
            self.tblUserData.reloadData()
        }
    }
    
    @IBAction func segmentControllTapped(_ sender: Any) {
        switch segmentControll.selectedSegmentIndex {
            
        case 0:
            self.filteredData = userData
            self.searchedData = userData
            self.tblUserData.reloadData()
        case 1:
            self.filteredData = userData.filter({ $0.city == "Chicago" })
            self.searchedData = userData.filter({ $0.city == "Chicago" })
            self.tblUserData.reloadData()
        case 2:
            self.filteredData = userData.filter({ $0.city == "NewYork" })
            self.searchedData = userData.filter({ $0.city == "NewYork" })
            self.tblUserData.reloadData()
        case 3:
            self.filteredData = userData.filter({ $0.city == "Los Angeles" })
            self.searchedData = userData.filter({ $0.city == "Los Angeles" })
            self.tblUserData.reloadData()
            
        default:
            self.filteredData = userData
            self.tblUserData.reloadData()
        }
    }
}


extension FeedViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataTableViewCell", for: indexPath) as! UserDataTableViewCell
        cell.lblCity.text = filteredData[indexPath.row].city
        cell.lblFullName.text = (filteredData[indexPath.row].first_name ?? "") + (filteredData[indexPath.row].last_name ?? "")
        return cell
    }
    
    
}

extension FeedViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            self.filteredData = searchedData
            self.tblUserData.reloadData()
        }else{
            
            self.filteredData = self.userData.filter({ ((($0.first_name ?? "") + ($0.last_name ?? "")).localizedLowercase).contains(searchText.localizedLowercase) })
            self.tblUserData.reloadData()
        }
    }
}
