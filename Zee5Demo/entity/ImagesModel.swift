//
//  ImagesModel.swift
//  Zee5Demo
//
//  Created by Admin on 13/05/21.
//

import Foundation


class ImagesModel: Codable {
    let batchcomplete: String
    let welcomeContinue: Continue
    let query: Query

    enum CodingKeys: String, CodingKey {
        case batchcomplete
        case welcomeContinue = "continue"
        case query
    }

    init(batchcomplete: String, welcomeContinue: Continue, query: Query) {
        self.batchcomplete = batchcomplete
        self.welcomeContinue = welcomeContinue
        self.query = query
    }
}

// MARK: - Query
class Query: Codable {
    let pages: [String: Page]

    init(pages: [String: Page]) {
        self.pages = pages
    }
}

// MARK: - Page
class Page: Codable {
    let pageid, ns: Int
    let title: String
    let index: Int
    let thumbnail: Thumbnail?

    init(pageid: Int, ns: Int, title: String, index: Int, thumbnail: Thumbnail?) {
        self.pageid = pageid
        self.ns = ns
        self.title = title
        self.index = index
        self.thumbnail = thumbnail
    }
}

// MARK: - Thumbnail
class Thumbnail: Codable {
    let source: String
    let width, height: Int

    init(source: String, width: Int, height: Int) {
        self.source = source
        self.width = width
        self.height = height
    }
}

// MARK: - Continue
class Continue: Codable {
    let gpsoffset: Int
    let continueContinue: String

    enum CodingKeys: String, CodingKey {
        case gpsoffset
        case continueContinue = "continue"
    }

    init(gpsoffset: Int, continueContinue: String) {
        self.gpsoffset = gpsoffset
        self.continueContinue = continueContinue
    }
}




//{
//   "batchcomplete":"",
//   "continue":{
//      "gpsoffset":10,
//      "continue":"gpsoffset||"
//   },
//   "query":{
//      "pages":{
//         "3144":{
//            "pageid":3144,
//            "ns":0,
//            "title":"A Doll's House",
//            "index":4,
//            "thumbnail":{
//               "source":"https://upload.wikimedia.org/wikipedia/commons/f/fd/A_Doll%27s_House.jpeg",
//               "width":330,
//               "height":431
//            }
//         },
//         "17901388":{
//            "pageid":17901388,
//            "ns":0,
//            "title":"Doll Domination",
//            "index":8
//         },
//         "8100":{
//            "pageid":8100,
//            "ns":0,
//            "title":"Dollar",
//            "index":9,
//            "thumbnail":{
//               "source":"https://upload.wikimedia.org/wikipedia/commons/a/ad/Joachimsthaler_1525.jpg",
//               "width":325,
//               "height":159
//            }
//         },
//         "367810":{
//            "pageid":367810,
//            "ns":0,
//            "title":"Dollar General",
//            "index":6,
//            "thumbnail":{
//               "source":"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/DGheadquartersTN.jpg/640px-DGheadquartersTN.jpg",
//               "width":640,
//               "height":415
//            }
//         },
//         "374778":{
//            "pageid":374778,
//            "ns":0,
//            "title":"Dollar coin (United States)",
//            "index":3,
//            "thumbnail":{
//               "source":"https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/2020_Native_American_Dollar_Reverse.jpeg/640px-2020_Native_American_Dollar_Reverse.jpeg",
//               "width":640,
//               "height":640
//            }
//         },
//         "2308563":{
//            "pageid":2308563,
//            "ns":0,
//            "title":"Dollar sign",
//            "index":2,
//            "thumbnail":{
//               "source":"https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Dollar_sign_fonts.svg/640px-Dollar_sign_fonts.svg.png",
//               "width":640,
//               "height":471
//            }
//         },
//         "2939177":{
//            "pageid":2939177,
//            "ns":0,
//            "title":"Dollars Trilogy",
//            "index":7
//         },
//         "14014034":{
//            "pageid":14014034,
//            "ns":0,
//            "title":"Dollhouse (TV series)",
//            "index":5
//         },
//         "8716":{
//            "pageid":8716,
//            "ns":0,
//            "title":"Dolly Parton",
//            "index":1,
//            "thumbnail":{
//               "source":"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Dolly_Parton_accepting_Liseberg_Applause_Award_2010_portrait.jpg/435px-Dolly_Parton_accepting_Liseberg_Applause_Award_2010_portrait.jpg",
//               "width":435,
//               "height":640
//            }
//         },
//         "10171399":{
//            "pageid":10171399,
//            "ns":0,
//            "title":"The Dollyrots",
//            "index":10,
//            "thumbnail":{
//               "source":"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/The_Dollyrots_2012.JPG/640px-The_Dollyrots_2012.JPG",
//               "width":640,
//               "height":358
//            }
//         }
//      }
//   }
//}
