# AGRO APP 

## A One Stop Place for Farmers
Traditionally farmers have used their perceptual sensorial systems to diagnose and monitor their crops health and needs. <br/>
However, humans possess five basic perceptual systems with accuracy levels that can change from human to human which are largely dependent on the stress, experience, health and age.<br/>
To overcome this problem, in the last decade, with the help of the emergence of smartphone technology, new agronomic applications were developed to reach better, cost-effective, more accurate and portable diagnosis systems.<br/> 
With apps and websites being used virtually everywhere, we decided to create an all-purpose Flutter application for farmers as our submission for [Vihaan 4.0](https://vihaan.ieeedtu.in/) hackathon.

## Disclaimer
This repository contains all files required for the app.<br/>
Files related to training of crop yield prediction algorithm and deployed flask server can be found [here](https://github.com/jatinpandey02/Crop-Yield-API-Flask)

## Features
* User authentication and authorization using Auth0.
* Marketplace, where farmers can buy and sell various products adding by them and others. 
* Crop disease prediction and cure suggestion using TensorFlow lite model trained by Teachable Machine. 
* Crop yield estimate predicion made using Python and Flask, deployed on Heroku.
* Farming news provided by making custom API calls from [News API](https://newsapi.org/).
* Live weather provided by [OpenWeather API](https://openweathermap.org/api) and geolocation.

## Goals/Functionalities
We planned to implement five major features in ourapplication with the simplest UI possible so that it’s easy for the user to understand and use the application.
* Market Place
  * Seller<br/>
    This section enables the user to sell their productionand other similar products on our platform.
  * Buyer<br/>
    This section enables the user to buy products from our platform. We have added the functionalities of filters based on the categories of the product. Apart from this we have added the “Contact Dealer” feature as well.
* Crop Disease Prediction with suggestion of cures
  * We developed a Machine Learning model with the help of TensorFlow Lite by feeding image data for various plant diseases. This feature can be utilized without the internet aswell as the model is locally integrated in our app.
* Crop Yield Estimation Prediction
  * On the basis of the average rainfall per year, pesticidesused, average air temperature and the crop to be grown, the farmer will be able to get an estimate of the crop yield by using this Machine Learning model deployed online.
* News related to farming
  * With the help of a custom API we are able to fetch agriculture related News data in our application and display it to the user.
* Live Weather
  * As an additional feature we are also providing the user with the weather information in his/her region.

## Screnshots
|                   |                   |                   |
| -                 | -                 | -                 |
| ![image](https://github.com/helewrer3/vihaan_app/blob/garvit/screenshots/Screenshot_1618121953.png) | ![image](https://github.com/helewrer3/vihaan_app/blob/garvit/screenshots/Screenshot_1618121984.png) | ![image](https://github.com/helewrer3/vihaan_app/blob/garvit/screenshots/Screenshot_1618121997.png) |
| ![image](https://github.com/helewrer3/vihaan_app/blob/garvit/screenshots/Screenshot_1618122018.png) | ![image](https://github.com/helewrer3/vihaan_app/blob/garvit/screenshots/Screenshot_1618122022.png) | ![image](https://github.com/helewrer3/vihaan_app/blob/garvit/screenshots/Screenshot_1618122067.png) |
| ![image](https://github.com/helewrer3/vihaan_app/blob/garvit/screenshots/Screenshot_1618122090.png) | ![image](https://github.com/helewrer3/vihaan_app/blob/garvit/screenshots/Screenshot_1618122102.png) | ![image](https://github.com/helewrer3/vihaan_app/blob/garvit/screenshots/Screenshot_1618122112.png) |
| ![image](https://github.com/helewrer3/vihaan_app/blob/garvit/screenshots/Screenshot_1618122120.png) | ![image](https://github.com/helewrer3/vihaan_app/blob/garvit/screenshots/Screenshot_1618122124.png) | ![image](https://github.com/helewrer3/vihaan_app/blob/garvit/screenshots/Screenshot_1618122269.png) |
| ![image](https://github.com/helewrer3/vihaan_app/blob/garvit/screenshots/Screenshot_1618122337.png) | ![image](https://github.com/helewrer3/vihaan_app/blob/garvit/screenshots/Screenshot_1618122904.png) |  |

## Technologies Used
| Technology        | Home Page         |
| -                 | -                 |
| Flutter Web | https://flutter.dev/web |
| Firebase | https://firebase.google.com |
| Flask | https://flask.palletsprojects.com |
| NodeJS | https://nodejs.org/en/ |
| Heroku | https://www.heroku.com/ |
| TensorFlow Lite | https://www.tensorflow.org/lite |
| Auth0 | https://auth0.com/ |
| Teachable Machine | https://teachablemachine.withgoogle.com/ |

## Contributors
| Technology        | Home Page         |
| -                 | -                 |
| Garvit Kansal | https://github.com/helewrer3 |
| Hemang Sinha | https://github.com/hemangdtu |
| Jatin Pandey | https://github.com/jatinpandey02 |
| Shubham Shrivastava | https://github.com/Shubham6013 |