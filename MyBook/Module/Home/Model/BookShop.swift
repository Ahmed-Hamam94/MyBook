//
//  BookShop.swift
//  MyBook
//
//  Created by Ahmed Hamam on 10/12/2023.
//

import Foundation

struct BookShop: Codable {

    let kind: String?
    let totalItems: Int?
    let items: [Items]?

    private enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case totalItems = "totalItems"
        case items = "items"
    }
}

struct Items: Codable {

    let kind: String?
    let id: String?
    let etag: String?
    let selfLink: String?
    let volumeInfo: VolumeInfo?
    let saleInfo: SaleInfo?
  
    private enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case id = "id"
        case etag = "etag"
        case selfLink = "selfLink"
        case volumeInfo = "volumeInfo"
        case saleInfo = "saleInfo"
    
    }

}

struct VolumeInfo: Codable {

    let title: String?
    let authors: [String]?
    let publisher: String?
    let publishedDate: String?
    let description: String?
    let industryIdentifiers: [IndustryIdentifiers]?
    let readingModes: ReadingModes?
    let pageCount: Int?
    let printType: String?
    let categories: [String]?
    let averageRating: Int?
    let ratingsCount: Int?
    let maturityRating: String?
    let allowAnonLogging: Bool?
    let contentVersion: String?
    let panelizationSummary: PanelizationSummary?
    let imageLinks: ImageLinks?
    let language: String?
    let previewLink: String?
    let infoLink: String?
    let canonicalVolumeLink: String?

    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case authors = "authors"
        case publisher = "publisher"
        case publishedDate = "publishedDate"
        case description = "description"
        case industryIdentifiers = "industryIdentifiers"
        case readingModes = "readingModes"
        case pageCount = "pageCount"
        case printType = "printType"
        case categories = "categories"
        case averageRating = "averageRating"
        case ratingsCount = "ratingsCount"
        case maturityRating = "maturityRating"
        case allowAnonLogging = "allowAnonLogging"
        case contentVersion = "contentVersion"
        case panelizationSummary = "panelizationSummary"
        case imageLinks = "imageLinks"
        case language = "language"
        case previewLink = "previewLink"
        case infoLink = "infoLink"
        case canonicalVolumeLink = "canonicalVolumeLink"
    }
}

struct IndustryIdentifiers: Codable {
    let type: String?
    let identifier: String?

    private enum CodingKeys: String, CodingKey {
        case type = "type"
        case identifier = "identifier"
    }
}

struct ReadingModes: Codable {

    let text: Bool?
    let image: Bool?

    private enum CodingKeys: String, CodingKey {
        case text = "text"
        case image = "image"
    }
}

struct PanelizationSummary: Codable {

    let containsEpubBubbles: Bool?
    let containsImageBubbles: Bool?

    private enum CodingKeys: String, CodingKey {
        case containsEpubBubbles = "containsEpubBubbles"
        case containsImageBubbles = "containsImageBubbles"
    }
}

struct ImageLinks: Codable {

    let smallThumbnail: String?
    let thumbnail: String?

    private enum CodingKeys: String, CodingKey {
        case smallThumbnail = "smallThumbnail"
        case thumbnail = "thumbnail"
    }
}

struct SaleInfo: Codable {

    let country: String?
    let saleability: String?
    let isEbook: Bool?
    let listPrice: ListPrice?
    let retailPrice: RetailPrice?
    let buyLink: String?
    let offers: [Offers]?

    private enum CodingKeys: String, CodingKey {
        case country = "country"
        case saleability = "saleability"
        case isEbook = "isEbook"
        case listPrice = "listPrice"
        case retailPrice = "retailPrice"
        case buyLink = "buyLink"
        case offers = "offers"
    }
}


struct ListPrice: Codable {

    let amount: Double?
    let currencyCode: String?

    private enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case currencyCode = "currencyCode"
    }

}
struct RetailPrice: Codable {

    let amount: Double?
    let currencyCode: String?

    private enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case currencyCode = "currencyCode"
    }

}

struct Offers: Codable {

    let finskyOfferType: Int?
    let listPrice: ListPrice?
    let retailPrice: RetailPrice?

    private enum CodingKeys: String, CodingKey {
        case finskyOfferType = "finskyOfferType"
        case listPrice = "listPrice"
        case retailPrice = "retailPrice"
    }

}
