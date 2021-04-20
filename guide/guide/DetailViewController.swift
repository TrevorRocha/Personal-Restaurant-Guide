//
//  detailViewController.swift
//  guide
//
//  Created by Trevor Rocha on 2021-04-19.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    var getName = String()
    var getAddress = String()
    var getDescription = String()
    var getTag = String()
    
    @IBOutlet weak var rName: UILabel!
    @IBOutlet weak var rAddress: UILabel!
    @IBOutlet weak var rTag: UILabel!
    @IBOutlet weak var rDescription: UILabel!    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rName.text! = getName
        rAddress.text! = getAddress
        rTag.text! = getTag
        rDescription.text! = getDescription
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
