/// Wrap Message for Android&iOS
class MessageModel {
  String? displayType;
  Map<String, dynamic>? extra;
  MessageBodyModel? body;
  String? msgId;

  MessageModel(this.displayType, this.extra, this.body, this.msgId);

  factory MessageModel.fromJson(Map<String, dynamic> srcJson) {
    return MessageModel(
      srcJson['displayType'] as String?,
      srcJson['extra'] as Map<String, dynamic>?,
      srcJson['body'] == null ? null : MessageBodyModel.fromJson(srcJson['body'] as Map<String, dynamic>),
      srcJson['msgId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'displayType': displayType,
    'extra': extra,
    'body': body?.toJson(),
    'msgId': msgId,
  };
}

/// Umeng Push Message Body Content
class MessageBodyModel {
  String? afterOpen;
  String? ticker;
  String? custom;
  String? url;
  String? activity;
  String? title;
  String? playSound;
  String? playLights;
  String? playVibrate;
  String? text;

  MessageBodyModel(this.afterOpen, this.ticker, this.custom, this.url, this.activity, this.title, this.playSound,
      this.playLights, this.playVibrate, this.text);

  factory MessageBodyModel.fromJson(Map<String, dynamic> srcJson) {
    return MessageBodyModel(
      srcJson['afterOpen'] as String?,
      srcJson['ticker'] as String?,
      srcJson['custom'] as String?,
      srcJson['url'] as String?,
      srcJson['activity'] as String?,
      srcJson['title'] as String?,
      srcJson['playSound'] as String?,
      srcJson['playLights'] as String?,
      srcJson['playVibrate'] as String?,
      srcJson['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'afterOpen': afterOpen,
    'ticker': ticker,
    'custom': custom,
    'url': url,
    'activity': activity,
    'title': title,
    'playSound': playSound,
    'playLights': playLights,
    'playVibrate': playVibrate,
    'text': text,
  };
}
