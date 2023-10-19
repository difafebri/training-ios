//
//  NewEmployeeViewModel.swift
//  TestDay1
//
//  Created by P090MMCTSE003 on 19/10/23.
//

import Foundation
import CoreData
import UIKit

class NewEmployeeViewModel: NSObject{
//    private var apiService: APIService!
    private(set) var NewEmployeeData: [NewEmployeeModel] = []{
        didSet{
            self.bindDataToVC()
        }
    }
    
    var bindDataToVC: () -> () = {}
    
    override init(){
        super.init()
    }
    
    func fetchData(){
        self.NewEmployeeData = readEmployees()
    }
    
    func readEmployees() -> [NewEmployeeModel]{
        var newEmployees = [NewEmployeeModel]()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "NewEmployee")
        do{
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            
            result.forEach{ newEmployee in
                newEmployees.append(NewEmployeeModel(
                    nama: newEmployee.value(forKey: "nama") as! String,
                    id: newEmployee.value(forKey: "id") as! Int,
                    salary: newEmployee.value(forKey: "salary") as! Int))
            }
        } catch let err {
            print(err)
        }
        return newEmployees
//        return newEmployees
    }
    
    func create(_ id: Int, _ nama: String, _ salary: Int){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let empEntity = NSEntityDescription.entity(forEntityName: "NewEmployee", in: managedContext)
        
        let insert = NSManagedObject(entity: empEntity!, insertInto: managedContext)
        insert.setValue(id, forKey: "id")
        insert.setValue(nama, forKey: "nama")
        insert.setValue(salary, forKey: "salary")
        
        appDelegate.saveContext()
        
        self.NewEmployeeData = readEmployees()
    }
    
    func update(_ id: Int, _ nama: String, _ salary: Int, index: Int){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "NewEmployee")
        
        do{
            let fetch = try manageContext.fetch(fetchRequest)
            let dataToUpdate = fetch[index] as! NSManagedObject
            dataToUpdate.setValue(nama, forKey: "nama")
            dataToUpdate.setValue(id, forKey: "id")
            dataToUpdate.setValue(salary, forKey: "salary")
            appDelegate.saveContext()
        } catch let err {
            print(err)
        }
    }
    
    func delete(_ index:Int){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "NewEmployee")
        
        do{
            let dataTobeDeleted = try managedContext.fetch(fetchRequest)[index] as! NSManagedObject
            managedContext.delete(dataTobeDeleted)
            appDelegate.saveContext()
        } catch let errorDelete{
            print(errorDelete)
        }
    }
}

