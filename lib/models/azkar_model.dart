class AzkarModel{
  final List<Content>content;
  AzkarModel({required this.content});
  factory  AzkarModel.fromJson(Map<String,dynamic>json)
  {
    List<dynamic>data=List.from(json['content']);
    List<Content>zekr=data.map((e) =>Content.fromJson(e)).toList();
    return  AzkarModel( content:zekr );
  }
}
class Content
{
  final String zekr;
  final int repeat;
  final String bless;

  Content({required this.zekr, required this.repeat,required this.bless});
  factory Content.fromJson(Map<String,dynamic>json)
  {
    return Content(zekr: json['zekr'],
        repeat: json['repeat'],
        bless: json['bless']);
  }
}