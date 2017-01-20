# CustomLocationDataSourceV100.0-ObjC

[中文说明](https://github.com/makeling/CustomLocationDataSourceV100.0-ObjC/blob/master/README_CN.md)

## OverView

This sample contains sample code demonstrating how to customize a location datasource based on ArcGIS Runtime SDK for iOS 100.0. This sample is an entire project that can be opened in XCode and instantly run on a simulator or a device.

The ```master``` branch of this repository contains samples configured for the latest available version.

## Features


In this project, the CustomLocationDataSource class inherited from AGSCLLocationDataSource interface. AGSCLLocationDataSource in fact is the encapsulation of Apple's Core Location Service, the location information managed by CLLocationManager Object. The Display implemented by AGSLocationDisplay. From this, you can understand the locate function in ArcGIS Runtime SDK for iOS 100.0 is just determined by the device. The location points would be reprojected to the basemap spatial reference before be drawed to the map.

If you have the requirement for playback the historical tract in your application, you can save the location information to an array in method setLocationChangedHandler, then you can create the historical track playback function by AGSSimulatedLocationDataSource class.

## Requirements

* [ArcGIS Runtime SDK for iOS 100](https://developers.arcgis.com/en/ios/) (Requires ArcGIS Online account; free to sign up)
* XCode 8 (or higher)
* iOS 10 SDK (or higher)


