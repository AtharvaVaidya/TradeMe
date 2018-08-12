// To parse the JSON, add this file to your project and do:
//
//   let listing = try? JSONDecoder().decode(Listing.self, from: jsonData)

import Foundation

public struct Listing: Codable, Equatable
{
    let listingID: Int
    let title, category: String
    let startPrice: Double
    let buyNowPrice: Double?
    let pictureHref: String?
    let reserveState: Int?
    let hasReserve: Bool?
    let hasBuyNow: Bool?
    let priceDisplay: String?
    let region: String?
    
    enum CodingKeys: String, CodingKey
    {
        case listingID = "ListingId"
        case title = "Title"
        case category = "Category"
        case startPrice = "StartPrice"
        case buyNowPrice = "BuyNowPrice"
        case pictureHref = "PictureHref"
        case reserveState = "ReserveState"
        case hasReserve = "HasReserve"
        case hasBuyNow = "HasBuyNow"
        case priceDisplay = "PriceDisplay"
        case region = "Region"
    }
}
