//
//  DetailViewController.swift
//  test3
//
//  Created by stagiaire on 03/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!



    func configureView() {
        // Update the user interface for the detail item.
        if let pokemon = self.detailItem {
            if let idL = self.idLabel {
                idL.text = "\(pokemon.id)"
            }
            if let nameL = self.nameLabel {
                nameL.text = pokemon.name
            }
            if let weightL = self.weightLabel {
                weightL.text = pokemon.weight
            }
            if let heightL = self.heightLabel {
                heightL.text = pokemon.height
            }
            if let typeL = self.typeLabel {
                typeL.text = pokemon.element
                corresElement(element: pokemon.element)
            }
        }
    }
    
    func corresElement(element: String){
        elementImage.image = UIImage(named: "\(element)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Pokemon? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

