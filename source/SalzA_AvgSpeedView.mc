import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;

using Toybox.Math;

class SalzA_AvgSpeed {
  function avg_speed_function(salzA_distance_meters, salzA_time_seconds) {
    if (salzA_time_seconds > 0) {
      var avg_speed = salzA_distance_meters / salzA_time_seconds;
      avg_speed = avg_speed * 3.6;
      return avg_speed.format("%.1f") + " km/h";
    } else {
      return "--";
    }
  }
}

class SalzA_AvgSpeedView extends WatchUi.SimpleDataField {
  function initialize() {
    SimpleDataField.initialize();
    label = "PR. RYCH. DO LIM.";
  }

  function compute(info) {
    var avgSpeed = new SalzA_AvgSpeed();
    var func = avgSpeed.method( : avg_speed_function);
    return limitLogic(info, func);
  }
}