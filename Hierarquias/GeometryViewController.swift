//
//  GeometryViewController.swift
//  Hierarquias
//
//  Created by Eduardo Vital Alencar Cunha on 05/04/17.
//  Copyright © 2017 Vital. All rights reserved.
//

import UIKit

class GeometryViewController: UIViewController {

    var data: CustomView?

    override func viewDidLoad() {
        super.viewDidLoad()


        if let geometryView = self.data {
            print("The data was received")
            self.view.addSubview(geometryView)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
