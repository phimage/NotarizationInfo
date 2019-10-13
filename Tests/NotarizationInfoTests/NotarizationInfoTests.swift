import XCTest
@testable import NotarizationInfo

final class NotarizationInfoTests: XCTestCase {

    func testSuccess() {
        let status: NotarizationStatus = .success
        guard let response = try? NotarizationResponse(from: testReponse(status)) else {
            XCTFail("Fail to decode response")
            return
        }
        XCTAssertEqual(response.notarizationInfo?.status, status)
    }

    func testInProgress() {
        let status: NotarizationStatus = .inProgress
        guard let response = try? NotarizationResponse(from: testReponse(status)) else {
            XCTFail("Fail to decode response")
            return
        }
        XCTAssertEqual(response.notarizationInfo?.status, status)
    }

    func testInvalid() {
        let status: NotarizationStatus = .invalid
        guard let response = try? NotarizationResponse(from: testReponse(status)) else {
            XCTFail("Fail to decode response")
            return
        }
        XCTAssertEqual(response.notarizationInfo?.status, status)
    }

    func testUpload() {
        guard let response = try? NotarizationResponse(from: uploadResponse) else {
            XCTFail("Fail to decode response")
            return
        }
        XCTAssertNotNil(response.notarizationUpload)
    }

    static var allTests = [
        ("testSuccess", testSuccess),
        ("testInProgress", testInProgress),
        ("testInvalid", testInvalid),
        ("testUpload", testUpload)
    ]
}

func testReponse(_ status: NotarizationStatus) -> String {
    switch status {
    case .success:
        return """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
        <key>notarization-info</key>
        <dict>
        <key>Date</key>
        <date>2019-10-16T08:00:00Z</date>
        <key>LogFileURL</key>
        <string>https://example.com/log.json</string>
        <key>RequestUUID</key>
        <string>12345678-aaaa-bbbb-cccc-111111111111</string>
        <key>Status</key>
        <string>success</string>
        <key>Status Code</key>
        <integer>2</integer>
        <key>Status Message</key>
        <string>Package Approved</string>
        </dict>
        <key>os-version</key>
        <string>10.15.0</string>
        <key>success-message</key>
        <string>No errors getting notarization info.</string>
        <key>tool-path</key>
        <string>/Applications/Xcode.app/Contents/Applications/Application Loader.app/Contents/Frameworks/ITunesSoftwareService.framework</string>
        <key>tool-version</key>
        <string>1.1.1138</string>
        </dict>
        </plist>
        """
    case .invalid:
        return """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
        <key>notarization-info</key>
        <dict>
        <key>Date</key>
        <date>2019-10-16T08:00:00Z</date>
        <key>LogFileURL</key>
        <string>https://example.com/log.json</string>
        <key>RequestUUID</key>
        <string>12345678-aaaa-bbbb-cccc-111111111111</string>
        <key>Status</key>
        <string>invalid</string>
        <key>Status Code</key>
        <integer>2</integer>
        <key>Status Message</key>
        <string>Package Invalid</string>
        </dict>
        <key>os-version</key>
        <string>10.15.0</string>
        <key>success-message</key>
        <string>No errors getting notarization info.</string>
        <key>tool-path</key>
        <string>/Applications/Xcode.app/Contents/Applications/Application Loader.app/Contents/Frameworks/ITunesSoftwareService.framework</string>
        <key>tool-version</key>
        <string>1.1.1138</string>
        </dict>
        </plist>
        """
    case .inProgress:
        return """
        <plist version="1.0">
        <dict>
        <key>notarization-info</key>
        <dict>
        <key>Date</key>
        <date>2019-10-16T08:00:00Z</date>
        <key>RequestUUID</key>
        <string>12345678-aaaa-bbbb-cccc-111111111111</string>
        <key>Status</key>
        <string>in progress</string>
        <key>Status Code</key>
        <integer>0</integer>
        <key>Status Message</key>
        <string>Package Approved</string>
        </dict>
        <key>os-version</key>
        <string>10.15.0</string>
        <key>success-message</key>
        <string>No errors getting notarization info.</string>
        <key>tool-path</key>
        <string>/Applications/Xcode.app/Contents/Applications/Application Loader.app/Contents/Frameworks/ITunesSoftwareService.framework</string>
        <key>tool-version</key>
        <string>1.1.1138</string>
        </dict>
        </plist>
        """
    }
}

let uploadResponse = """
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
     <dict>
        <key>notarization-upload</key>
        <dict>
           <key>RequestUUID</key>
           <string>12345678-aaaa-bbbb-cccc-111111111111</string>
        </dict>
        <key>os-version</key>
        <string>10.15.0</string>
        <key>success-message</key>
        <string>No errors uploading '/path/to/my.dmg'.</string>
        <key>tool-path</key>
        <string>/Applications/Xcode.app/Contents/Applications/Application Loader.app/Contents/Frameworks/ITunesSoftwareService.framework</string>
        <key>tool-version</key>
        <string>1.1.1138</string>
     </dict>
  </plist>
  """
