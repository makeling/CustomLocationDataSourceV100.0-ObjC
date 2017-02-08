# CustomLocationDataSourceV100.0-ObjC示范工程

##概览

在使用ArcGIS Runtime SDK for iOS 100.0开发iOS地图应用时，我们经常会碰到iphone定位的位置信息，在底图上显示位置不正确的情况。导致这一结果的原因，可能是由于安全原因，底图进行了算法偏移，也可能是因为底图本身就是自定义坐标系。解决这一问题，可以通过自定义位置数据源来实现，在自定义数据源中通过算法来调整设备获取的位置坐标。这个工程演示了基于ArcGIS Runtime SDK for iOS 100.0实现客户化位置数据源的实现思路。这是一个完整独立的工程，基于Xcode8.2版本开发，支持iOS9以上的系统部署。

##说明：

工程中包含的CustomLocationDataSource类用于实现客户化数据源，继承自AGSCLLocationDataSource。AGSCLLocationDataSource数据源是Esri针对Apple的Core Location service的封装，位置信息通过CLLocationManager对象管理。位置信息的呈现通过AGSLocationDisplay对象实现。从这儿能够看出ArcGIS Runtime SDK for iOS 100.0的位置信息就是取自设备的定位信息。定位点在绘制到底图之前会重新投影到底图的空间参考上。

如果在项目中，还有对定位信息进行历史轨迹回放的功能需求，可以通过setLocationChangedHandler方法将定位点信息保存到数组中，后续通过AGSSimulatedLocationDataSource进行历史轨迹回放。

##系统需求：

1. ArcGIS Runtime SDK for iOS 100.0
2. Xcode 8(或更高)
3. iOS 10 SDK（或更高）

##工程下载地址：
[CustomLocationDataSourceV100.0Demos](https://github.com/makeling/CustomLocationDataSourceV100.0-ObjC.git)
