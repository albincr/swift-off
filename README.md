# Swift Off :rocket:
[![Build Status](https://travis-ci.org/goprimer/swift-off.svg?branch=master)](https://travis-ci.org/goprimer/swift-off)

Swift Off is a boilerplate project for Xcode which makes it easy to get started building an iOS app using Swift. It's a great starting point for any new app. We've already included several standard SDKs and setup all the boring stuff, so you can just focus on building the core of your app!

### What's already built for you:
- Ideal Swift App Structure
- Base Storyboard and Navigation Bar
- Beautiful, easy to use UI with [Material](https://github.com/CosmicMind/Material)
- Analytics Tracking and Integrations with [Segment](https://segment.com)
- Customizable Signup (Email, Facebook, or Phone #) and Login with [Primer](https://goprimer.com)
- User (+More) Account Storage with [Firebase](https://www.firebase.com/)
- Crash & Error Reporting with [Rollbar](https://rollbar.com/)
- Elegant HTTP interaction with [Alamofire](https://github.com/Alamofire/Alamofire)
- Functional tool-belt for Swift with [Dollar](https://github.com/ankurp/Dollar)
- Ability to easily include future SDKs with [Cocoapods](https://cocoapods.org/)

We put this together because we wanted a great starting point for working on side projects or test apps. We also got tired of rebuilding all this stuff ourselves and thought it was a great way to showcase the correct structure of a standard Swift app.

## Requirements

#### Cocoapods
You'll need to have Cocoapods installed on your computer to install the external SDKs. Trust us, it's one of the best ways to manage external SDKs in your app.

```sh
sudo gem install cocoapods
```

You'll need CocoaPods version 0.36+, so if you're using an older version, you can update by running the command above. More installation instructions can be found [here](https://guides.cocoapods.org/using/getting-started.html#getting-started).

#### Xcode 7.2+

## Getting Started

#### 1. Download and Open the Project
Download and extract the latest project [zip](archive/master.zip), or using git to clone the repository. In your terminal, type:

    git clone https://github.com/goprimer/swift-off.git

Next, open the terminal and navigate to the Swift Off directory. Once there, run

    pod install

This will install all the project’s dependencies. Now you can open the project in XCode with

    open Swift\ Off.xcworkspace/

Your XCode Project should resemble the screenshot below.

![Project structure](https://i.imgur.com/tweKfSq.png)

#### 2. Getting a Firebase URL

Firebase will allow us to save our app data, all we need to do is sign up for a free account. Sign up a for free account, and Firebase will give you a URL to interact with your data store. Paste your firebase url in the MainViewController, shown in the screenshot below.

![Where to change Firebase URL in LoginManager.swift](http://i.imgur.com/j8m15in.png)

Swift Off will now compile and run without issues.

#### 3. Welcome Screens

Swift Off uses Primer for welcome, login, and sign up screens. Swift Off already includes these screens by default to get you started, but it's recommended to get your own Primer token so that you can customize your screens to your liking.

<img src="https://i.imgur.com/6kFXW4r.png" height="400"/><img src="https://i.imgur.com/ILlsLQb.png" height="400"/>

<sup>Welcome screen and our main interface out of the box</sup>

<a href="http://goprimer.com/dashboard#/signup?swiftOff=true" target="_blank">Navigate here</a> and sign up for a free account. As soon as we log in, we should see our welcome screens. We can click on a screen to edit it, but for now let's just copy our token from the top left of the page and paste it into our code. If we ever need to find our token again, it can be found in Primer's <a href="https://goprimer.com/dashboard#/project//edit" target="_blank">project settings page</a>.

![Getting our Primer token](http://imgur.com/Z04COXD.png)

In `AppDelegate.swift`, there are a few lines of code that initialize Primer. Paste your primer token at the appropriate line.

```swift
Primer.sharedInstance().onboardDelegate = LoginManager.sharedInstance
Primer.sharedInstance().requiresLogin = true
Primer.sharedInstance().registerClientWithToken(“<PRIMER_TOKEN>”) // Primer token here!
```

#### 4. Rename your project
Of course you want the app to be named something awesome! You can easily rename the Swift Off template app.

In this example let's assume you are naming your app: **Kitty Clothes**

1. Unzip `swift-off-master.zip` and rename the folder to `kitty-clothes`.
2. Open your `Swift Off.xcproject` file in Xcode (inside `kitty-clothes/`).
3. Follow Apple's [guide to renaming projects](https://developer.apple.com/library/ios/recipes/xcode_help-project_editor/RenamingaProject/RenamingaProject.html).
4. Rename your Bundle Identifier in XCode settings.
5. Quit Xcode.
6. Update your Podfile target:

  Use terminal (`vim Podfile`) or your favorite text editor:

    Change: `target 'Swift Off' do` to `target 'Kitty Clothes' do`

#### Create XCode Workspace
Cocoapods creates a .xcworkspace which includes all the required SDKs bundled with your future app!

```sh
cd kitty-clothes/
pod install
open Kitty\ Clothes.xcworkspace
```

This will install the required libraries, create your xcworkspace and then open it in Xcode. You can also open the .xcworkspace file directly from Xcode.

Make sure you are opening the .xcworkspace and not your .xcproject or else you're gonna have a bad time.

#### Get Firebase Token
Before you can run your app, you are required to have a free Firebase token. To get one, you'll need to go to https://firebase.com and signup for an account.

#### Launch Kitty Clothes
You're done! Now press the Play button in Xcode to build and run your project using one of the Simulators.

You should see a cute Kitten greeting you on your Install screen with options to signup or login. Once you go through the Signup flow, you'll see your application running with a navigation bar and side menu.

## What's Next?
Now you can get to work building your amazing app!

We've written a tutorial on how to build... and you can find it...

## Live Apps built with Swift Off
None yet :cry:. Is your app live and built from Swift Off? Create a PR and add it here!
