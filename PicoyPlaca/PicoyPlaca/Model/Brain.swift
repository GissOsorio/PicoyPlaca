//
//  Brain.swift
//  PicoyPlaca
//
//  Created by Gisela Osorio on 15/6/22.
//

import Foundation

struct Brain {
    let week = [
        Day(name: "Monday", numbers: [1,2]),
        Day(name: "Tuesday", numbers: [3,4]),
        Day(name: "Wednesday", numbers: [5,6]),
        Day(name: "Thursday", numbers: [7,8]),
        Day(name: "Friday", numbers: [9,0]),
    ]
    
    let interval = [
        Interval(name: "morning",start: Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date())!, end: Calendar.current.date(bySettingHour: 9, minute: 30, second: 0, of: Date())!),
        Interval(name: "afternoon",start: Calendar.current.date(bySettingHour: 16, minute: 0, second: 0, of: Date())!, end: Calendar.current.date(bySettingHour: 19, minute: 30, second: 0, of: Date())!)
    ]
    
    func search(plate: String, date: String, time: Date) -> Bool{
        
        return true
    }
    
    func plateValidation(plate: String) -> Bool{
        for ch in plate{
            print(ch)
        }
        return true
    }
    func dateValidation(date: String) -> Bool{
        for ch in date{
            print(ch)
        }
        return true
    }
    
    func dateToDayWeek(dateString: String) -> String{
        
        return "Lunes"
    }
    
}
