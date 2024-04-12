# UC Flutter Task

Flutter Task for UC.

## Getting Started

- Install flutter from the official [docs](https://flutter.dev/docs/get-started/install).
- Install the code editor vscode from the official [docs](https://code.visualstudio.com/download)



## Running the project

This project runs out of the box. However, below are the steps for running this project.

- Clone the project
- Open it up in the already downloaded code editor
- Run `flutter pub get` to install required dependencies
- Create `.env.development` and `.env.production` files in the root folder of the project. That is: 
```sh
.
├── android                   
├── assets                    
├── ios                       
├── lib                       
└── test
└── .env.development
└── .env.production                      
```

- Add the following keys to the `envs` created and add corresponding values accordingly 
```sh
   BASE_URL = ""
   LOGO_BASE_URL = "" (here the full url up to /images is added)
   LOGO_ACCESS_KEY = ""
   BASE64_ENCODED_VIDEO_URL = "" (here the provided base64encoded string is suffixed by ==)
```
- Select a device from your devices list
- Run `flutter run` to launch the app on the selected device.
