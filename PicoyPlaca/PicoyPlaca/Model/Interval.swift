//
//  Interval.swift
//  PicoyPlaca
//
//  Created by Gisela Osorio on 16/6/22.
//

import Foundation

struct Interval {
    let name: String
    let start: Date
    let end: Date
    
    init(name: String,start: Date,end: Date){
        self.name = name
        self.start = start
        self.end = end
    }
}
