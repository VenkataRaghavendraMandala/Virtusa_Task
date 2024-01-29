//
//  ArtWorksModel.swift
//  Virtusa_Task
//
//  Created by Apple on 29/01/24.
//

import Foundation


struct ArtWorksModel: Decodable {
    var data: [Data]?
}

struct Data: Decodable {
    var title: String?
    var artist_display: String?
    var place_of_origin: String?
    var description: String?
}
