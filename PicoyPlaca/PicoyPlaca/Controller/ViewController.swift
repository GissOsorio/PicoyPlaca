//
//  ViewController.swift
//  PicoyPlaca
//
//  Created by Gisela Osorio on 15/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
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
            answerLabel.text = "Your car is allowed to be on the road!"
            answerLabel.textColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
            answerImage.image = images[2]
            answerLabel.text = "Your car is not allowed to be on the road!"
            answerLabel.textColor = UIColor.red
        }
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        searchBtn.backgroundColor = UIColor.clear
        plateTxt.text = ""
        dateTxt.text = ""
        answerImage.image = images[0]
        plateTextValidation.text = "Required"
        plateTextValidation.textColor = UIColor.red
        dateTextValidation.text = "Required"
        dateTextValidation.textColor = UIColor.red
        searchBtn.isEnabled = false
        answerLabel.text = "Find out if your car is allowed to be on the road"
        answerLabel.textColor = UIColor.purple
    }
    

    @IBAction func plateValidated(_ sender: UITextField) {
        if let plate = plateTxt.text {
            let validation = brain.plateValidation(plate: plate)
            if validation{
                plateTextValidation.text = "Great!"
                plateTextValidation.textColor = UIColor.purple
                brain.plateEnable = true
            }else{
                plateTextValidation.text = "Incorrect Plate!"
                plateTextValidation.textColor = UIColor.red
                brain.plateEnable = false
            }
            updateButton()
        }
    }
    
    @IBAction func dateValidation(_ sender: UITextField) {
        if let date = dateTxt.text {
            let validation = brain.dateValidation(date: date)
            if validation{
                dateTextValidation.text = "Great!"
                dateTextValidation.textColor = UIColor.purple
                brain.dateEnable = true
            }else{
                dateTextValidation.text = "Incorrect Date!"
                dateTextValidation.textColor = UIColor.red
                brain.dateEnable = false
            }
            updateButton()
        }
    }
    func updateButton(){
        if brain.plateEnable && brain.dateEnable {
            searchBtn.isEnabled = true
        }else{
            searchBtn.isEnabled = false
        }
    }
    
}

