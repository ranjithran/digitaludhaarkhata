class Customer {
  final int id;
  final int phonenumber;
  final String name;
  final int status;

  Customer(this.id, this.phonenumber, this.name, this.status);
}
class CustomerEntries{
  final String dateTime;
  final int gave;
  final int got;
  final int status;

  CustomerEntries(this.dateTime, this.gave, this.got, this.status);
}

class CustomerEntriesDeatils{
  final String datetime;
  final int money;

  CustomerEntriesDeatils(this.datetime, this.money);
}