//
//  Car.swift
//  TradeMe
//
//  Created by Atharva Vaidya on 11/08/2018.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import Foundation

struct Vehicle: Codable {
    let type, bodyStyle: String
    let doors, engineSize: Int
    let make, model: String
    let odometer, year: Int
    let transmission, fuel, numberPlate, bestContactTime: String
    let cylinders, owners: Int
    let vin, wofExpires, registrationExpires, stereoDescription: String
    let exteriorColour, importHistory: String
    let isDealer: Bool
    let showroom: Showroom
    let dealerName: String
    let hasMotorWebBasicReport: Bool
    let modelDetail: String
    
    enum CodingKeys: String, CodingKey {
        case type = "__type"
        case bodyStyle = "BodyStyle"
        case doors = "Doors"
        case engineSize = "EngineSize"
        case make = "Make"
        case model = "Model"
        case odometer = "Odometer"
        case year = "Year"
        case transmission = "Transmission"
        case fuel = "Fuel"
        case numberPlate = "NumberPlate"
        case bestContactTime = "BestContactTime"
        case cylinders = "Cylinders"
        case owners = "Owners"
        case vin = "Vin"
        case wofExpires = "WofExpires"
        case registrationExpires = "RegistrationExpires"
        case stereoDescription = "StereoDescription"
        case exteriorColour = "ExteriorColour"
        case importHistory = "ImportHistory"
        case isDealer = "IsDealer"
        case showroom = "Showroom"
        case dealerName = "DealerName"
        case hasMotorWebBasicReport = "HasMotorWebBasicReport"
        case modelDetail = "ModelDetail"
    }
}

struct Showroom: Codable {
    let id: Int
    let url, logo, banner, backgroundColour: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case url = "Url"
        case logo = "Logo"
        case banner = "Banner"
        case backgroundColour = "BackgroundColour"
    }
}
