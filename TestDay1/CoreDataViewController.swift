//
//  CoreDataViewController.swift
//  TestDay1
//
//  Created by P090MMCTSE003 on 19/10/23.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var NewEmployeeTableView: UITableView!
    @IBOutlet weak var addNewEmployeeButton: UIButton!
    
    var newEmployeeData = [NewEmployeeModel]()
    var viewModel: NewEmployeeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewEmployeeTableView.register(
            UINib(nibName: "NewEmployeeCell", bundle: nil
        ), forCellReuseIdentifier: "NewEmployeeCell")
        
//        self.newEmployeeData = readEmployees()
        
        NewEmployeeTableView.dataSource = self
        NewEmployeeTableView.delegate = self
        NewEmployeeTableView.rowHeight = 80
        
        // init view model
        viewModel = NewEmployeeViewModel()
        viewModel.bindDataToVC = {
            self.NewEmployeeTableView.reloadData()
        }
        viewModel.fetchData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.NewEmployeeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NewEmployeeTableView.dequeueReusableCell(withIdentifier: "NewEmployeeCell", for: indexPath) as! NewEmployeeCell
        cell.isiID.text = String (self.viewModel.NewEmployeeData[indexPath.row].id)
        cell.isiNama.text = self.viewModel.NewEmployeeData[indexPath.row].nama
        cell.isiSalary.text = String (self.viewModel.NewEmployeeData[indexPath.row].salary)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nama = self.viewModel.NewEmployeeData[indexPath.row].nama
        let id = self.viewModel.NewEmployeeData[indexPath.row].id
        let salary = self.viewModel.NewEmployeeData[indexPath.row].salary
        
        let alert = UIAlertController(title: "Edit Employee", message: "Edit The Form to Edit Employee", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {tf in tf.placeholder = "Id"
            tf.text = "\(id)"
        })
        
        alert.addTextField(configurationHandler: {tf in tf.placeholder = "Name"
            tf.text = "\(nama)"
        })
        
        alert.addTextField(configurationHandler: {tf in tf.placeholder = "Salary"
            tf.text = "\(salary)"
        })

        
        alert.addAction(UIAlertAction(title: "Edit", style:.default, handler: { action in
        
            //check if text field is empty
            if(alert.textFields![0].text!.isEmpty || alert.textFields![1].text!.isEmpty) {
                let warning = UIAlertController(title: "Warning", message: "Fill all the textfields", preferredStyle: .alert)
                warning.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(warning, animated: true)
            } else {
                self.viewModel.update(Int(alert.textFields![0].text!)!, alert.textFields![1].text!, Int(alert.textFields![2].text!)!, index: indexPath.row)
                let success = UIAlertController(title: "Success", message: "Data added", preferredStyle: .alert)
                success.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(success, animated: true)
                self.viewModel.fetchData()
                self.NewEmployeeTableView.reloadData()
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Delete", style:.default, handler: { action in
        
            //check if text field is empty
            self.viewModel.delete(indexPath.row)
                let success = UIAlertController(title: "Success", message: "Data deleted", preferredStyle: .alert)
                success.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(success, animated: true)
                self.viewModel.fetchData()
                self.NewEmployeeTableView.reloadData()
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: true)
    }
    
    @IBAction func addNewEmployee(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add Employee", message: "Fill The Form to Add New Employee", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {tf in tf.placeholder = "Id"
        })
        
        alert.addTextField(configurationHandler: {tf in tf.placeholder = "Name"
        })
        
        alert.addTextField(configurationHandler: {tf in tf.placeholder = "Salary"
        })
        
        alert.addAction(UIAlertAction(title: "Tambah", style:.default, handler: { action in
        
            //check if text field is empty
            if(alert.textFields![0].text!.isEmpty || alert.textFields![1].text!.isEmpty) {
                let warning = UIAlertController(title: "Warning", message: "Fill all the textfields", preferredStyle: .alert)
                warning.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(warning, animated: true)
            } else {
                self.viewModel.create(Int(alert.textFields![0].text!)!, alert.textFields![1].text!, Int(alert.textFields![2].text!)!)
                let success = UIAlertController(title: "Success", message: "Data Updated", preferredStyle: .alert)
                success.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(success, animated: true)
                self.viewModel.fetchData()
                self.NewEmployeeTableView.reloadData()
            }
        }))
        alert.addAction((UIAlertAction(title: "Cancel", style: .cancel)))
        self.present(alert, animated: true)
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
