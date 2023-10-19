//
//  EmployeeViewModel.swift
//  TestDay1
//
//  Created by P090MMCTSE003 on 19/10/23.
//

import Foundation

class EmployeeViewModel: NSObject{
    private var apiService: APIService!
    private(set) var employeeData: [Employee] = []{
        didSet{
            self.bindDataToVC()
        }
    }
    
    var bindDataToVC: () -> () = {}
    
    override init(){
        super.init()
        apiService = APIService()
    }
    
    func fetchData(){
        apiService.fetchNewEmployees{ employees in
            print(employees)
            self.employeeData = employees
        } onError: { error in
            print(error ?? "")
        }
    }
}

