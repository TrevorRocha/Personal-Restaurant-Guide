//
//  ViewController.swift
//  guide
//
//  Created by Trevor Rocha on 2021-04-19.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rName: UITextField!
    @IBOutlet weak var rDescription: UITextField!
    @IBOutlet weak var rAddress: UITextField!
    @IBOutlet weak var rTag: UITextField!
    
//    let tableView: UITableView = {
//        let table = UITableView()
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return table
//    }()
    
    private var models = [Restaurants]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Restaurant Guide"
        getAllItems()
        
//      view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.frame = view.bounds
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    @IBAction func onGoButton(_ sender: Any) {
        performSegue(withIdentifier: "aboutSegue", sender: self)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        DispatchQueue.main.async{
            cell.textLabel?.text =  model.name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        DvC.getName = model.name!
        DvC.getAddress = model.address!
        DvC.getDescription = model.descriptions!
        DvC.getTag = model.tag!
        
        self.navigationController?.pushViewController(DvC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.deleteItem(item: model)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    @IBAction func addRestaurant(_ sender: UIButton) {
        let n = rName.text
        let d = rDescription.text
        let a = rAddress.text
        let t = rTag.text
        
        self.createRestaurant(name: n!, description: d!, address: a!, tag: t!)
        
        rName.text = ""
        rAddress.text = ""
        rDescription.text = ""
        rTag.text = ""
    }
    
    func getAllItems(){
        do {
            models = try context.fetch(Restaurants.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            
        }
    }
    func createRestaurant(name: String, description: String, address: String, tag: String) {
        let newItem = Restaurants(context: context)
        newItem.name = name
        newItem.descriptions = description
        newItem.address = address
        newItem.tag = tag
        
        do{
            try context.save()
            print("Working")
            print(newItem.name)
            print(newItem.descriptions)
            print(newItem.address)
            print(newItem.tag)
            getAllItems()
        }
        catch{
        }
    }
    func deleteItem(item: Restaurants) {
        context.delete(item)
        do{
            try context.save()
            getAllItems()
        }
        catch{
            
        }
    }
    func updateItem(item: Restaurants, newName: String, newDescription: String, newAddress: String, newTag: String) {
        item.name = newName
        item.descriptions = newDescription
        item.address = newAddress
        item.tag = newTag
        do{
            try context.save()
            getAllItems()
        }
        catch{
            
        }
    }


}

