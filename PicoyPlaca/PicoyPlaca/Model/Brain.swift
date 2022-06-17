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
    
    let intervalos = [
        Interval(name: "morning",start: Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date())!, end: Calendar.current.date(bySettingHour: 9, minute: 30, second: 0, of: Date())!),
        Interval(name: "afternoon",start: Calendar.current.date(bySettingHour: 16, minute: 0, second: 0, of: Date())!, end: Calendar.current.date(bySettingHour: 19, minute: 30, second: 0, of: Date())!)
    ]
    
    func search(plate: String, date: String, time: Date) -> Bool{
        let timeSearch = time.addingTimeInterval(TimeInterval(-5.0 * 3600.0))
        let lastNumber = String(plate.suffix(1))
        if let dayWeek = dateToDayWeek(dateString: date){
            return checkDayWeek(dayWeek: dayWeek, lastNumber: lastNumber,timeSearch:timeSearch)
        }
        return false
    }
    
    func checkDayWeek(dayWeek: String,lastNumber: String, timeSearch: Date) -> Bool{
        if let i = week.firstIndex(where: { $0.name == dayWeek }) {
            let dia = week[i]
            for number in dia.numbers{
                if number == Int(lastNumber){
                    if checkTime(time: timeSearch){
                        return false
                    }
                }
            }
        }
        return true
    }
    
    func checkTime(time: Date) -> Bool{
        for interval in intervalos{
            if time >= interval.start.addingTimeInterval(TimeInterval(-5.0 * 3600.0)) && time <= interval.end.addingTimeInterval(TimeInterval(-5.0 * 3600.0)){
                return true
            }
        }
        return false
    }
    
    func plateValidation(plate: String) -> Bool{
        if plate.count < 9 && plate.count > 6{
            let letters = plate.prefix(3)
            for ch in letters{
                if !ch.isLetter{
                    return false
                }
            }
            let startSlash = plate.index(plate.startIndex, offsetBy: 3)
            let endSlash = plate.index(plate.startIndex, offsetBy: 4)
            let slash = plate[startSlash..<endSlash]
            if slash != "-"{
                return false
            }
            let start = plate.index(plate.startIndex, offsetBy: 4)
            let numbers = plate[start...]
            for ch in numbers{
                if !ch.isNumber{
                    return false
                }
            }
            return true
        }
        return false
    }
    
    func dateValidation(date: String) -> Bool{
        if date.count > 9 && date.count < 11{
            if dateToDayWeek(dateString: date) != nil{
                let month = Int(date.prefix(2)) ?? 0
                if month < 1 && month > 12{
                    return false
                }
                let start = date.index(date.startIndex, offsetBy: 3)
                let end = date.index(date.startIndex, offsetBy: 5)
                let year = Int(date[start..<end]) ?? 0
                if year < 1 && year > 31{
                    return false
                }
               return true
            }
        }
        return false
    }
    
    func dateToDayWeek(dateString: String) -> String?{
        let weekDays = [
                "Sunday",
                "Monday",
                "Tuesday",
                "Wednesday",
                "Thursday",
                "Friday",
                "Saturday"
            ]
            let formatter  = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            guard let myDate = formatter.date(from: dateString) else { return nil }
            let myCalendar = Calendar(identifier: .gregorian)
            let weekDay = myCalendar.component(.weekday, from: myDate)
            return weekDays[weekDay-1]

    }
    
}
