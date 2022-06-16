//
//  ViewController.swift
//  PicoyPlaca
//
//  Created by Gisela Osorio on 15/6/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dateTextValidation: UILabel!
    @IBOutlet weak var plateTextValidation: UILabel!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var plateTxt: UITextField!
    @IBOutlet weak var dateTxt: UITextField!
    @IBOutlet weak var answerImage: UIImageView!
    @IBOutlet weak var timePicker: UIDatePicker!
    var brain = Brain()
    let images = [#imageLiteral(resourceName: "picoPlaca.png"),#imageLiteral(resourceName: "canBeOnTheRoad.png"),#imageLiteral(resourceName: "canNotBeOnTheRoad.png")]
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func searchPlate(_ sender: UIButton) {
        let plate = plateTxt.text!
        let date = dateTxt.text!
        let time = timePicker.date
        let answer = brain.search(plate: plate, date: date, time: time)
        if answer {
            sender.backgroundColor = UIColor.green
            answerImage.image = images[1]
        }else{
            sender.backgroundColor = UIColor.red
            answerImage.image = images[2]
        }
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        searchBtn.backgroundColor = UIColor.clear
        plateTxt.text = ""
        dateTxt.text = ""
        answerImage.image = images[0]
        plateTextValidation.text = "Required"
        dateTextValidation.text = "Required"
    }
    

    @IBAction func plateValidated(_ sender: UITextField) {
        print("vdsds")
        searchBtn.isEnabled = false
        if let plate = plateTxt.text {
            let validation = brain.plateValidation(plate: plate)
            if validation{
                searchBtn.isEnabled = true
                plateTextValidation.text = "Incorrect Plate"
            }
        }
    }
    
    

    @IBAction func dateValidation(_ sender: UITextField) {
        print("fecha")
        searchBtn.isEnabled = false
        if let date = dateTxt.text {
            let validation = brain.dateValidation(date: date)
            if validation{
                searchBtn.isEnabled = true
                dateTextValidation.text = "Incorrect Date"
            }
        }
    }
    
}

