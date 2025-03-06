# 🚀 Using Rive with Swift
Integrate Rive animations (.riv files) seamlessly into your Swift applications with the Rive SPM library.

## 📦 Installation
To install the Rive SPM library:
1. Select Add Package in Xcode.
2. Enter the following URL in the search bar: https://github.com/rive-app/rive-ios.

## 📄 Usage

### Importing RiveRuntime
Once installed, import RiveRuntime to instantiate the view models:

```swift
import RiveRuntime
```
### Creating a ViewModel
To create a RiveViewModel, specify the file name. For example, for shapes.riv:

```swift
RiveViewModel(fileName: "shapes")
```
If your file contains multiple artboards, specify the specific artboard:

```swift
RiveViewModel(fileName: "icons", artboardName: "HOME")
```
You can also specify the animation or state machine to use at this stage.

### ▶️ Playing a Linear Animation
To play a linear animation, call .play() on your view model when desired:

```swift
myViewModel.play()
```
You can also pause, reset, change the direction, and change the looping style in a similar way. Read more at the [Rive documentation on animation playback.](https://rive.app/docs/runtimes/animation-playback)

### 🤖 Controlling State Machine
To manipulate a view model with a selected state machine, use the setInput command to pass numeric values or boolean values. You can even trigger named events.

Numeric Input
```swift
starsVM.setInput("Rating Changed", value: 5)
```
Boolean Input
```swift
toggleVM.setInput("Switch Flipped", value: true)
```
Trigger Input
```swift
confettiVM.triggerInput("Celebrate")
```

For more complex tasks like controlling audio and updating text inside of an animation, [consult the Rive documentation.](https://rive.app/docs/runtimes)
