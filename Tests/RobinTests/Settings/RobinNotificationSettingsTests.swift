//
// Copyright (c) 2017 Ahmed Mohamed <dev@ahmd.pro>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#if !os(watchOS)
import XCTest
@testable import Robin
import UserNotifications

@available(iOS 10.0, macOS 10.14, *)
class RobinNotificationSettingsTests: XCTestCase {
    func testInit() {
        var notificationSettings = RobinNotificationSettings(alertStyle: .alert,
                                                             authorizationStatus: .denied,
                                                             enabledSettings: [.badge, .alert, .sound])
        
        XCTAssertEqual(notificationSettings.alertStyle, .alert)
        XCTAssertEqual(notificationSettings.authorizationStatus, .denied)
        XCTAssertEqual(notificationSettings.enabledSettings, [.badge, .alert, .sound])
        
        if #available(iOS 11.0, *) {
            notificationSettings._showPreviews = UNShowPreviewsSetting.always
            notificationSettings._showPreviews = UNShowPreviewsSetting.never
            
            XCTAssertEqual(notificationSettings.showPreviews, .always)
        }
    }
    
    func testInvalidShowPreviewsSetting() {
        var notificationSettings = RobinNotificationSettings(alertStyle: .alert,
                                                             authorizationStatus: .denied,
                                                             enabledSettings: [.badge, .alert, .sound])
        
        XCTAssertEqual(notificationSettings.alertStyle, .alert)
        XCTAssertEqual(notificationSettings.authorizationStatus, .denied)
        XCTAssertEqual(notificationSettings.enabledSettings, [.badge, .alert, .sound])
        
        if #available(iOS 11.0, *) {
            notificationSettings._showPreviews = ""
            
            XCTAssertEqual(notificationSettings.showPreviews, .never)
        }
    }
}
#endif
