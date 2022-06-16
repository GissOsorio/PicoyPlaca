//
//  Schedule.swift
//  PicoyPlaca
//
//  Created by Gisela Osorio on 16/6/22.
//

import Foundation

struct Schedule {
    let start: Date
    let end: [Int]
    
    init(name: String,numbers: [Int]){
        self.name = name
        self.numbers = numbers
    }
}
