//
//  ViewController.swift
//  simpsonBook
//
//  Created by Furkan Cingöz on 10.09.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var simpsonss = [Simpson]()
    var chosenSimpson : Simpson?
    @IBOutlet weak var tabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.dataSource = self
        tabelView.delegate = self
        
        //simpson
        let homer = Simpson(nameInput: "Homer", jobInput: "Nuclear Safety", imageInput: UIImage(named: "homer")!)
        let marge = Simpson(nameInput: "Marge", jobInput: "House Wife", imageInput: UIImage(named: "marge")!)
        let bart = Simpson(nameInput: "Bart", jobInput: "Student", imageInput: UIImage(named: "bart")!)
        let lisa = Simpson(nameInput: "Lisa", jobInput: "Student", imageInput: UIImage(named: "lisa")!)
        let maggie = Simpson(nameInput: "Maggie", jobInput: "babby", imageInput: UIImage(named: "maggie")!)
        
        simpsonss.append(homer)
        simpsonss.append(marge)
        simpsonss.append(bart)
        simpsonss.append(lisa)
        simpsonss.append(maggie)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonss.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = simpsonss[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = simpsonss[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destination = segue.destination as! toDetailsVC
            destination.selectedSimpson = chosenSimpson
        }
    }
}

