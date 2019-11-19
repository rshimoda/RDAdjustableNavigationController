[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

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
