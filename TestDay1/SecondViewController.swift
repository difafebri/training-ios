//
//  SecondViewController.swift
//  TestDay1
//
//  Created by P090MMCTSE003 on 13/10/23.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController{
    
    var parseName : String = ""
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var tableViewMain: UITableView!
    
    let dataProfile = Profile(name: "Difa", job: "Karyawan Swasta", age: "25", bio: "test")
    
    let profileTypeOrder = [ProfileType.name, ProfileType.job, ProfileType.age, ProfileType.bio]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelOne.text = parseName
        tableViewMain.register(
            UINib(nibName: "ProfileTableViewCell", bundle: nil
        ), forCellReuseIdentifier: "ProfileCell")
        
        tableViewMain.dataSource = self
        tableViewMain.delegate = self
        tableViewMain.rowHeight = UITableView.automaticDimension
        tableViewMain.estimatedRowHeight = 170
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTableViewCell
        let cellData: [(ProfileType, String)] = [
            (self.profileTypeOrder[0], self.dataProfile.name),
            (self.profileTypeOrder[1], self.dataProfile.job),
            (self.profileTypeOrder[2], self.dataProfile.age),
            (self.profileTypeOrder[3], self.dataProfile.bio)
        ]
        cell.setValue(type: cellData[indexPath.row].0, value: cellData[indexPath.row].1)
        return cell
    }
}
