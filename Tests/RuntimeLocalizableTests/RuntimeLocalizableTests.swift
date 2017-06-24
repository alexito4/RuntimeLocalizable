//
//  RuntimeLocalizableTests.swift
//  RuntimeLocalizable
//
//  Created by Alejandro Martínez on {TODAY}.
//  Copyright © 2017 RuntimeLocalizable. All rights reserved.
//

import Foundation
import XCTest
@testable import RuntimeLocalizable

class RuntimeLocalizableTests: XCTestCase {
    
    func testExample() {
        let strings = [
            "es": [
                "live": "En vivo, runtime!",
                "runtime": "Corriendo!"
            ],
            "es_ES": [
                "live": "En vivo, runtime! ES",
                "runtime": "Corriendo! ES"
            ],
            "es-MX": [
                "live": "En vivo, runtime! MX",
                "runtime": "Corriendo! MX"
            ],
            "en": [
                "live": "Live, runtime!",
                "runtime": "Runtime!"
            ]
        ]
        
        let rl = RuntimeLocalizable(translations: strings, name: "Test")
        let _ = try! rl.bundle()
        
        XCTAssertTrue(FileManager.default.fileExists(atPath: rl.bundlePath.path))
        
        let esPath = rl.bundlePath.appendingPathComponent("es.lproj").appendingPathComponent("Test.strings")
        XCTAssertTrue(FileManager.default.fileExists(atPath: esPath.path))
        let es = try! String(contentsOf: esPath, encoding: .utf32)
        XCTAssertEqual(
            es,
            "\"live\" = \"En vivo, runtime!\";\n\"runtime\" = \"Corriendo!\";\n"
        )

        try! FileManager.default.removeItem(at: rl.bundlePath)
    }
    
    func testClean() {
//        let rl = RuntimeLocalizable(translations: strings, name: "Test")
//        let localBundle = rl.bundle()
//        
//        print(localBundle.localizedString(forKey: "runtime", value: "Trying a string at runtime", table: "Test"))
//        print(NSLocalizedString("live", tableName: "Test", bundle: localBundle, value: "Trying a string at runtime", comment: "Trying a string at runtime"))
//        
//        let r2 = RuntimeLocalizable(translations: strings, name: "Dos")
//        _ = r2.bundle()
//        
//        rl.clean()
//        
//        print(localBundle.localizedString(forKey: "runtime", value: "Trying a string at runtime", table: "Dos"))
//        
//        r2.clean()
//        
//        rl.clean()
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}
