# Countries case project 🇺🇿 🇸🇰 🇿🇼 🇦🇱

![Application](https://github.com/repfly/Countries/blob/main/Repository/demo.gif?raw=true)

## Table Of Contents

* [About](#about)
  * [Discussion](#discussion)
  * [Dependencies Used](#dependencies-used)
* [Installation](#installation)
  * [Launching The Project](#launching-the-project)
* [License](#license)

## About

This repository contains an iOS film browser project that utilizes reactive and modern components.

### Discussion
I know there are some weird choices in the project. First of all, why not use Core Data to store objects? Well, I've tried to keep the overall logical complexity low and even it is not a good practice, it was fun to implement. Another criticism that can be made for using an extension to make HTTP requests. And the point that I'm trying to make before is valid in here too. Because it will not be a commercial app that consumes the hell out of REST, implementing a simple generic extension does makes sense (to me at least) rather than multilayer protocol orianted network architectures. 

### Dependencies Used

* [SVGView](https://github.com/exyte/SVGView)

## Installation

⚠️ This project utilises SPM for dependencies, check their [website](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app) for further information.

To run the project, copy HTTPS link and clone the repository. After cloning the repository change your directory to the repository directory.

### Launching The Project

Open the project on Xcode by executing the following command:

```bash
open Countries.xcodeproj
```

After the Xcode window appears click run button to launch the application.

## License

[MIT](LICENSE)

