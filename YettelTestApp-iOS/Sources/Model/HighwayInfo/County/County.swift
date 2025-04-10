//
//  County.swift
//  YettelTestApp-iOS
//
//  Created by Madarász Krisztián on 2025. 04. 10..
//

import SwiftUI

public struct County: Codable, Hashable {
    let id: String
    let name: String
}

extension County {
    var countyShape: AnyShape? {
        switch id {
        case "YEAR_11":
            return AnyShape(YEAR_11())
        case "YEAR_12":
            return AnyShape(YEAR_12())
        case "YEAR_13":
            return AnyShape(YEAR_13())
        case "YEAR_14":
            return AnyShape(YEAR_14())
        case "YEAR_15":
            return AnyShape(YEAR_15())
        case "YEAR_16":
            return AnyShape(YEAR_16())
        case "YEAR_17":
            return AnyShape(YEAR_17())
        case "YEAR_18":
            return AnyShape(YEAR_18())
        case "YEAR_19":
            return AnyShape(YEAR_19())
        case "YEAR_20":
            return AnyShape(YEAR_20())
        case "YEAR_21":
            return AnyShape(YEAR_21())
        case "YEAR_22":
            return AnyShape(YEAR_22())
        case "YEAR_23":
            return AnyShape(YEAR_23())
        case "YEAR_24":
            return AnyShape(YEAR_24())
        case "YEAR_25":
            return AnyShape(YEAR_25())
        case "YEAR_26":
            return AnyShape(YEAR_26())
        case "YEAR_27":
            return AnyShape(YEAR_27())
        case "YEAR_28":
            return AnyShape(YEAR_28())
        case "YEAR_29":
            return AnyShape(YEAR_29())
        default:
            return nil
        }
    }
    
    var adjacentCounties: [String]? {
        switch id {
        case "YEAR_11": // Bács-Kiskun
            return ["YEAR_23", "YEAR_16", "YEAR_26", "YEAR_12", "YEAR_15", "YEAR_20", "YEAR_13"]
        case "YEAR_12": // Baranya
            return ["YEAR_24", "YEAR_26", "YEAR_11"]
        case "YEAR_13": // Békés
            return ["YEAR_15", "YEAR_11", "YEAR_20", "YEAR_18"]
        case "YEAR_14": // Borsod-Abaúj-Zemplén
            return ["YEAR_19", "YEAR_22", "YEAR_25", "YEAR_18"]
        case "YEAR_15": // Csongrád
            return ["YEAR_11", "YEAR_13"]
        case "YEAR_16": // Fejér
            return ["YEAR_21", "YEAR_28", "YEAR_26", "YEAR_11", "YEAR_23"]
        case "YEAR_17": // Győr-Moson-Sopron
            return ["YEAR_21", "YEAR_28", "YEAR_27"]
        case "YEAR_18": // Hajdú-Bihar
            return ["YEAR_25", "YEAR_14", "YEAR_20", "YEAR_13"]
        case "YEAR_19": // Heves
            return ["YEAR_22", "YEAR_14", "YEAR_20", "YEAR_23"]
        case "YEAR_20": // Jász-Nagykun-Szolnok
            return ["YEAR_19", "YEAR_18", "YEAR_13", "YEAR_11", "YEAR_23"]
        case "YEAR_21": // Komárom-Esztergom
            return ["YEAR_17", "YEAR_28", "YEAR_16", "YEAR_23", "YEAR_22"]
        case "YEAR_22": // Nógrád
            return ["YEAR_23", "YEAR_19", "YEAR_14", "YEAR_21"]
        case "YEAR_23": // Pest
            return ["YEAR_22", "YEAR_19", "YEAR_20", "YEAR_11", "YEAR_16", "YEAR_21"]
        case "YEAR_24": // Somogy
            return ["YEAR_29", "YEAR_28", "YEAR_26", "YEAR_12"]
        case "YEAR_25": // Szabolcs-Szatmár-Bereg
            return ["YEAR_14", "YEAR_18"]
        case "YEAR_26": // Tolna
            return ["YEAR_12", "YEAR_24", "YEAR_28", "YEAR_16", "YEAR_11"]
        case "YEAR_27": // Vas
            return ["YEAR_29", "YEAR_17"]
        case "YEAR_28": // Veszprém
            return ["YEAR_29", "YEAR_24", "YEAR_26", "YEAR_16", "YEAR_21", "YEAR_17"]
        case "YEAR_29": // Zala
            return ["YEAR_27", "YEAR_28", "YEAR_24"]
        default:
            return nil
        }
    }
}
