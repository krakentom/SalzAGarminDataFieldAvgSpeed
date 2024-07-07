class LimitPoint {
    var distance;
    var time_hour;
    var time_minute;
    var elevation_up;
    var elevation_down;

    function initialize(_distance, _time_hour, _time_minute, _elevation_up, _elevation_down) {
        distance = _distance;
        time_hour = _time_hour - 2;
        time_minute = _time_minute;
        elevation_up = _elevation_up;
        elevation_down = _elevation_down;
    }
}