//
//  ViewController.swift
//  MergeRequestDemo
//
//  Created by Andrew L. Jaffee on 3/28/19.
/*
 
 Copyright (c) 2019 Andrew L. Jaffee, microIT Infrastructure, LLC, and
 iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
*/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Initialize - we haven't checked temperature yet.
        temperatureLabel.text = "-- F"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Get temperature, format for presentation, and
    // display on screen.
    @IBAction func checkTempButtonTapped(_ sender: Any) {
        
        let temperature = getTemperature()
        let temperatureString = String(temperature) + " F"
        
        UIView.animate(withDuration: 2.0, animations: {
            self.temperatureLabel.alpha = 0.0
        }) { (success) in
            UIView.animate(withDuration: 2.0, animations: {
                self.temperatureLabel.alpha = 1.0
                self.temperatureLabel.text = temperatureString
            })
        }
        
    } // end func checkTempButtonTapped
    
    // Mock up a weather/temperature service.
    func getTemperature() -> Int {
        return Int(arc4random_uniform(99))
    }
    
}

