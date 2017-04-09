//
//  ViewController.swift
//  Hierarquias
//
//  Created by Eduardo Vital Alencar Cunha on 05/04/17.
//  Copyright © 2017 Vital. All rights reserved.
//

import UIKit

class PropertiesViewController: UIViewController {

    @IBOutlet weak var sliderDaCoordenadaX: UISlider!
    @IBOutlet weak var sliderDaCoordenadaY: UISlider!
    @IBOutlet weak var sliderDaAltura: UISlider!
    @IBOutlet weak var sliderDaLargura: UISlider!
    @IBOutlet weak var coordenadasXY: UILabel!
    @IBOutlet weak var dimensoes: UILabel!
    @IBOutlet weak var cor: UILabel!
    @IBOutlet weak var geometryFormSelector: UISegmentedControl!

    var coordenadaX: Double = 0.0
    var coordenadaY: Double = 0.0
    var altura: Double = 10
    var largura: Double = 10

    let elipseSelection = 1

    @IBAction func alterarCoordenadaXY(_ sender: UISlider) {
        self.coordenadaX = Double(self.sliderDaCoordenadaX.value).rounded()
        self.coordenadaY = Double(self.sliderDaCoordenadaY.value).rounded()

        self.coordenadasXY.text = String(format: "(x = %.0f, y =%.0f)", coordenadaX, coordenadaY)
    }

    @IBAction func alterarDimensoes(_ sender: UISlider) {
        self.altura = Double(self.sliderDaAltura.value).rounded()
        self.largura = Double(self.sliderDaLargura.value).rounded()

        self.dimensoes.text = String(format: "%.0f x %.0f", altura, largura)
    }

    @IBAction func alterarCor(_ sender: UIButton) {
        self.cor.backgroundColor = sender.backgroundColor
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "drawGeometryForm") {
            let geometryFrame = CGRect(x: self.coordenadaX, y: self.coordenadaY, width: self.largura, height: self.altura)
            let geometryView = CustomView(frame: geometryFrame)
            geometryView.backgroundColor = cor.backgroundColor

            if (self.geometryFormSelector.selectedSegmentIndex == elipseSelection) {
                geometryView.layer.cornerRadius = CGFloat(self.largura / 2)
            }

            (segue.destination as! GeometryViewController).data = geometryView
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Definindo valores minimo e máximo para os sliders de coordenadas baseado nos limites da tela
        sliderDaCoordenadaX!.maximumValue = Float(view.bounds.maxX)
        sliderDaCoordenadaX!.minimumValue = Float(view.bounds.minX)
        sliderDaCoordenadaY!.maximumValue = Float(view.bounds.maxY)
        sliderDaCoordenadaY!.minimumValue = Float(view.bounds.minY)

        // Definindo valores minimo e máximo para os sliders de dimensões baseado nos limites da tela
        sliderDaAltura!.maximumValue = Float(view.bounds.height)
        sliderDaAltura!.minimumValue = 1
        sliderDaLargura!.maximumValue = Float(view.bounds.width)
        sliderDaLargura!.minimumValue = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

