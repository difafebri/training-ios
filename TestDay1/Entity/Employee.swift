//
//  Employee.swift
//  TestDay1
//
//  Created by P090MMCTSE003 on 18/10/23.
//

import Foundation

struct EmployeeList: Decodable{
    let listEmp = [Employee]()
}

struct Employee: Decodable{
    let nama, gaji, umur: String
}

enum CodingKeys: String, CodingKey{
    case nama = "employee_name"
    case gaji = "employee_salary"
    case umur = "employee_age"
}
