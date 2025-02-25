// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Foundation
import XCTest

@testable import Client

class WallpaperURLProviderTests: XCTestCase {

    let testURL = WallpaperURLProvider.testURL

    func testMetadataURL() {
        let subject = WallpaperURLProvider()
        let expectedURL = URL(string: "\(testURL)/metadata/\(subject.currentMetadataEndpoint)/wallpapers.json")

        do {
            let actualURL = try subject.url(for: .metadata)
            XCTAssertEqual(actualURL,
                           expectedURL,
                           "The metadata url builder is returning the wrong url.")

        } catch {
            XCTFail("The url provider failed to provide any url: \(error.localizedDescription)")
        }
    }

    func testPathURL() {
        let subject = WallpaperURLProvider()
        let path = "path/to/image"
        let expectedURL = URL(string: "\(testURL)/\(path).png")

        do {
            let actualURL = try subject.url(for: .imageURL, withComponent: path)
            XCTAssertEqual(actualURL,
                           expectedURL,
                           "The image url builder is returning the wrong url.")

        } catch {
            XCTFail("The url provider failed to provide any url: \(error.localizedDescription)")
        }
    }
}
