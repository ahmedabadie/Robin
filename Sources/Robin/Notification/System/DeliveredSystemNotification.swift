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

import UserNotifications

/// A protocol that represents notifications delivered by the system.
@available(iOS 10.0, watchOS 3.0, macOS 10.14, *)
public protocol DeliveredSystemNotification {
    var date: Date { get }
    var request: UNNotificationRequest { get }
    
    /// Creates a `RobinNotification` from the passed `DeliveredSystemNotification`.
    ///
    /// - Parameter notification: The system notification to create the `RobinNotification` from.
    /// - Returns: The `RobinNotification` if the creation succeeded, nil otherwise.
    func robinNotification() -> RobinNotification
}

@available(iOS 10.0, watchOS 3.0, macOS 10.14, *)
public extension DeliveredSystemNotification {
    func robinNotification() -> RobinNotification {
        let notification = self.request.robinNotification()
        notification.deliveryDate = self.date
        notification.delivered = true
        
        return notification
    }
}
