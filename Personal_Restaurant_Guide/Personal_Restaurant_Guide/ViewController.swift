//
//  ViewController.swift
//  Personal_Restaurant_Guide
//
//  Created by Trevor Rocha on 2021-04-12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onGoButton(_ sender: Any) {
        performSegue(withIdentifier: "aboutSegue", sender: self)
    }
    
    @IBAction func addOnGoButton(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: self)
    }
    
    
    
    
}
