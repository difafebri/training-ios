//
//  EmployeeViewController.swift
//  TestDay1
//
//  Created by P090MMCTSE003 on 18/10/23.
//
import Alamofire
import UIKit

class EmployeeViewController: UIViewController {

    @IBOutlet weak var EmployeeTableView: UITableView!
    
    var employeeData = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees") else { return } 
        let urlConvertible: URLConvertible = url
        AF.request(
            urlConvertible,
            method: .get// put your Bearer Token here
        ).response { response in
            guard let dataEmployee = response.data else { return }
                do{
                    let res = try JSONDecoder().decode(EmployeeList.self, from: dataEmployee)
                    self.employeeData = res.listEmp
                    self.EmployeeTableView.reloadData()
                } catch let jsonErr{
                    print("error caught: ", jsonErr)
                }
        }
            
        }
            
        // Response data is DefaultDataResponse struct, that contains data, error, etc
        }
        
        // Do any additional setup after loading the view.
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


extension EmployeeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTable = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath) as! EmployeeTableViewCell
        cellTable.isiNama.text = self.employeeData[indexPath.row].nama
        cellTable.isiUmur.text = self.employeeData[indexPath.row].umur
        cellTable.isiGaji.text = self.employeeData[indexPath.row].gaji
        
        return cellTable
    }
    
    
}
