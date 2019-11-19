# RDAdjustableNavigationController

A navigation controller with adjustable navigation bar.

Available adjustemtns:
- navigation bar height
- navigation bar content alignment (top, middle, bottom)

## Usage example:

```swift
import RDAdjustableNavigationController

let viewController = UIViewController()

let navigationController = RDAdjustableNavigationController(rootViewController: viewController)
navigationController.useSystemHeight = false
navigationController.navigationBarHeight = 52.0
navigationController.contentVerticalAlignment = .bottom
```
