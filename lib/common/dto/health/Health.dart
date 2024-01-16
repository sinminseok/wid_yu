
class Health{
  double _spo2;
  double _temperature;
  double _heartBit;

  Health(this._spo2, this._temperature, this._heartBit);

  double get heartBit => _heartBit;

  double get temperature => _temperature;

  double get spo2 => _spo2;
}