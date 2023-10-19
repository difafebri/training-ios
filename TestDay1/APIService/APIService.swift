//
//  APIService.swift
//  TestDay1
//
//  Created by P090MMCTSE003 on 19/10/23.
//

import Foundation
import Alamofire

class APIService: NSObject{
    func fetchNewEmployees(
        onSuccess: @escaping([Employee]) -> Void, onError: @escaping (Error?) -> Void
    ){
        guard let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees") else { return }
        let urlConvertible: URLConvertible = url
        
        AF.request(urlConvertible, method: .get).response {
            response in
            if let responseData = response.data{
                do{
                    let data = try JSONDecoder().decode(EmployeeList.self, from: responseData)
//                    print(data)
                    DispatchQueue.main.async {
                        onSuccess(data.listEmp)
                    }
                } catch let jsonError{
                    onError(jsonError)
                }
            }
        }
    }
}
