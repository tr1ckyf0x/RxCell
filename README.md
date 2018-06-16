# RxCell

[![Version](https://img.shields.io/cocoapods/v/RxCell.svg?style=flat)](https://cocoapods.org/pods/RxCell)
[![License](https://img.shields.io/cocoapods/l/RxCell.svg?style=flat)](https://cocoapods.org/pods/RxCell)
[![Platform](https://img.shields.io/cocoapods/p/RxCell.svg?style=flat)](https://cocoapods.org/pods/RxCell)

If you're using [RxSwift](https://github.com/ReactiveX/RxSwift), you've probably encountered the following code more than a few times.

```swift
class MyCell: UITableViewCell {
  var reuseBag = DisposeBag()

  override func prepareForReuse() {
    super.prepareForReuse()
    reuseBag = DisposeBag()
  }
}
```

Instead of adding a new property to every object, use this library to add it for you, to any subclass of `UITableViewCell`, `UITableViewHeaderFooterView`, `UICollectionReusableView`.

```swift
thing
.bind(to: otherThing)
.disposed(by: rx.reuseDisposeBag)
```

## Installation

RxCell is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RxCell'
```

In AppDelegate.swift, just import RxCell framework and enable it.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  RxCell.activate()
  return true
}
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

tr1ckyf0x, vladislav.lisyanskiy@gmail.com
Inspired by https://github.com/bmoliveira/Cell-Rx

## License

RxCell is available under the MIT license. See the LICENSE file for more info.
