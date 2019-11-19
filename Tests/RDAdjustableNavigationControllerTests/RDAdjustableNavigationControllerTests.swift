import XCTest

@testable import RDAdjustableNavigationController

final class RDAdjustableNavigationControllerTests: XCTestCase {
    
    func testInitialization() {
        let dummyViewController = UIViewController()
        let adjustableNavigationViewController = RDAdjustableNavigationController(rootViewController: dummyViewController)
        
        XCTAssertNotNil(adjustableNavigationViewController)
    }
    
    static var allTests = [
        ("testInitialization", testInitialization),
    ]
}
