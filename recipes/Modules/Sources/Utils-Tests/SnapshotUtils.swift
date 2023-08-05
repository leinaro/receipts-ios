//
//  File.swift
//  
//
//  Created by Inés Rojas on 5/08/23.
//

import SnapshotTesting
import XCTest

public var defaultPixelPrecision: Float = 1.0
public var defaultPerceptualPrecision: Float = 0.90

private func getSnapshotPath(currentFilePath: StaticString, locale: String, module: String? = nil) -> String {
    let cleanFilePath: String = currentFilePath
        .description
        .replacingOccurrences(of: ".generated", with: "")
        .replacingOccurrences(of: ".swift", with: "/\(locale)/")

    var dir: String = "Snapshots/"
    if let module: String = module {
        dir += module + "/"
    } else {
        dir += "General/"
    }
    return cleanFilePath
        .replacingOccurrences(of: "Modules/Tests/PreviewsSnapshots-Tests", with: dir)
}

public func getImageSnapshotPath(
    locale: String,
    currentFilePath: StaticString = #filePath,
    module: String? = nil
) -> String {
    getSnapshotPath(currentFilePath: currentFilePath, locale: locale, module: module)
}

public func assertSnapshot<Value, Format>(
    matching value: @autoclosure () throws -> Value,
    as snapshotting: Snapshotting<Value, Format>,
    named name: String? = nil,
    record recording: Bool = false,
    snapshotDirectory: String? = nil,
    timeout: TimeInterval = 5,
    file: StaticString = #filePath,
    testName: String = #function,
    line: UInt = #line
) {
    let failure: String? = verifySnapshot(
        matching: try value(),
        as: snapshotting,
        named: name,
        record: recording,
        snapshotDirectory: snapshotDirectory,
        timeout: timeout,
        file: file,
        testName: testName,
        line: line
    )
    guard let message = failure else {
        return
    }
    XCTFail(message, file: file, line: line)
}

