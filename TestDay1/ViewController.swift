//
//  ViewController.swift
//  TestDay1
//
//  Created by P090MMCTSE003 on 12/10/23.
//

import UIKit

class ViewController: UIViewController {
    var nama: String=""

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }

    @IBAction func buttonClick(_ sender: Any) {
        //nama = mainLabel.text ?? "difa"
        
        performSegue(withIdentifier: "firstSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier=="firstSegue"){
//            
//        } else if (segue.identifier=="firstSegue"){
//            let destination = segue.destination as! EmployeeViewController
//            
//        }
       
    }
}

