
class Disease{
  String _name;
  String _medicline;
  String _description;

  Disease(this._name, this._medicline, this._description);

  String get description => _description;

  String get medicline => _medicline;

  String get name => _name;
}