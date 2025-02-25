// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

@testable import Client
import Foundation

class MockNotificationCenter: NotificationProtocol {

    var postCallCount = 0
    var addObserverCallCount = 0
    var removeObserverCallCount = 0

    weak var notifiableListener: Notifiable?

    func post(name: NSNotification.Name) {
        postCallCount += 1
        notifiableListener?.handleNotifications(Notification(name: name))
    }

    func addObserver(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?) {
        addObserverCallCount += 1
    }
    func removeObserver(_ observer: Any) {
        removeObserverCallCount += 1
    }
}
