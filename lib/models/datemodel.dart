class DateModel {

  final Hijri hijri;
  DateModel({ required this.hijri});
  factory DateModel.fromJson(Map<String, dynamic> json) {
    return DateModel( hijri: Hijri.fromJson(json['data']['hijri']));
  }
}

class Hijri {
  final WeekDay weekDay;
  final Month month;
  final String year;
  final String day;

  Hijri({required this.weekDay, required this.month, required this.year,required this.day});
  factory Hijri.fromJson(Map<String, dynamic> json) {
    return Hijri(day: json['day'],
        weekDay: WeekDay.fromJson(json['weekday']),
        month: Month.fromJson(json['month']),
         year: json['year']);
  }
}

class WeekDay {
  final String ar;
  WeekDay({required this.ar});
  factory WeekDay.fromJson(Map<String, dynamic> json) {
    return WeekDay(ar: json['ar']);
  }
}

class Month {

  final String ar;

  Month({ required this.ar});
  factory Month.fromJson(Map<String, dynamic> json)
  {
    return Month( ar: json['ar']);
  }
}


