import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;

using Toybox.Math;

function getLimitPoints() {
  var obrDrasal = [
    new LimitPoint(108.0, 13, 55, 0, 0),
    new LimitPoint(123.0, 15, 10, 0, 0),
    new LimitPoint(154.0, 18, 15, 0, 0),
    new LimitPoint(173.0, 20, 0, 0, 0),
  ];
  var salzkammergutTrophy = [
    new LimitPoint(23.0, 7, 0, 100, 50),
    new LimitPoint(83.0, 12, 10, 200, 100),
    new LimitPoint(119.0, 14, 20, 300, 150),
    new LimitPoint(148.0, 16, 30, 400, 200),
    new LimitPoint(170.0, 18, 45, 400, 200),
    new LimitPoint(209.7, 21, 0, 400, 200),
  ];
  var testData = [
    new LimitPoint(18.0, 23, 45, 100, 50),
    new LimitPoint(2.0, 20, 30, 200, 100),
    new LimitPoint(3.0, 21, 0, 300, 150),
    new LimitPoint(4.0, 23, 30, 400, 200),
  ];

  return salzkammergutTrophy;
}

function getDisatnceMeters(limitDistanceTo, distance) {
  return limitDistanceTo - distance;
}

function getTimeSeconds(limitPoint) {
  var now = Time.now().value();

  var limitTime = Gregorian.moment({
    :hour   => limitPoint.time_hour,
    :minute => limitPoint.time_minute,
    :second => 0
    }).value();

  return limitTime - now;
}

function isCurrentLimit(distance, limitDistanceFrom, limitDistanceTo) {
  return distance >= limitDistanceFrom && distance < limitDistanceTo;
}

function limitLogic(info, func) {
  if (info == null || info.elapsedDistance == null) {
    return "--";
  }

  var distance = info.elapsedDistance;

  var limitPoints = getLimitPoints();

  var limitDistanceFrom = 0;
  var limitDistanceTo = 0;
  for (var i = 0; i < limitPoints.size(); i++) {
    var limitPoint = limitPoints[i];
    limitDistanceTo = limitPoint.distance * 1000;

    if (isCurrentLimit(distance, limitDistanceFrom, limitDistanceTo)) {
      var salzA_distance_meters = getDisatnceMeters(limitDistanceTo, distance);
      var salzA_time_seconds = getTimeSeconds(limitPoint);

      return func.invoke(salzA_distance_meters, salzA_time_seconds);
    }

    limitDistanceFrom = limitPoint.distance * 1000;
  }

  return "--";
}