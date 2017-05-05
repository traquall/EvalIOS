//
//  MasterViewController.swift
//  test3
//
//  Created by stagiaire on 03/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    var pokemons: [Pokemon] = []
    var min = 1
    var max = 20

    
    func pokeLoad() {
        print("pokeload")
        pokemons = []
        
        for var i in min...max  {
            Alamofire.request("http://pokeapi.co/api/v2/pokemon/\(i)").responseJSON { response in
                //print(response)
               if let myJSON = response.result.value {
                  let res = JSON(myJSON)
                  //print(res)
                let pokemon = Pokemon(id: i, name: "\(res["name"])", weight: "\(res["weight"]) pounds", height: "\(res["height"]) feets", element: "\(res["types"][0]["type"]["name"])")
                print(res["types"][0]["type"]["name"])
                  self.pokemons += [pokemon]
                  self.tableView.reloadData()
                }
            }
        }
    }
    
    
    
    func nextPokemon(sender: UIBarButtonItem){
        self.min += 20
        self.max += 20
        
        pokeLoad()
    }
    
    func precPokemon(sender: UIBarButtonItem){
        if(self.min < 1){
            self.min -= 20
            self.max -= 20
            pokeLoad()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor.orange
        
        pokeLoad()
        self.navigationItem.title = "Pokedex !"
        
        let nextBI = UIBarButtonItem(
            title: "Next",
            style: .plain,
            target: self,
            action: #selector(nextPokemon(sender:))
        )
        let precBI = UIBarButtonItem(
            title: "Prec",
            style: .plain,
            target: self,
            action: #selector(precPokemon(sender:))
        )
        
        navigationItem.leftBarButtonItem = precBI
        navigationItem.rightBarButtonItem = nextBI
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func appendPokemon(pokemon: Pokemon)
    {
        self.pokemons.append(pokemon)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = pokemons[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.title = object.name;
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = self.pokemons[indexPath.row]
        cell.textLabel!.text = object.name
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

    }


}

