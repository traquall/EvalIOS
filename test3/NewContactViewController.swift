//
//  NewContactViewController.swift
//  test3
//
//  Created by stagiaire on 03/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var firstnameText: UITextField!
    
    override func viewDidLoad() {        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
