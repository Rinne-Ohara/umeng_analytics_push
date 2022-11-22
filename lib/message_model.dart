/// Wrap Message for Android&iOS
class MessageModel {
  String? displayType;
  Map<String, dynamic>? extra;
  MessageBodyModel? body;
  String? msgId;

  MessageModel(this.displayType, this.extra, this.body, this.msgId);

  factory MessageModel.fromJson(Map<String, dynamic> srcJson) {
    return MessageModel(
      srcJson['display_type'] as String?,
      srcJson['extra'] as Map<String, dynamic>?,
      srcJson['body'] == null ? null : MessageBodyModel.fromJson(srcJson['body'] as Map<String, dynamic>),
      srcJson['msg_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'display_type': displayType,
    'extra': extra,
    'body': body?.toJson(),
    'msg_id': msgId,
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
      srcJson['after_open'] as String?,
      srcJson['ticker'] as String?,
      srcJson['custom'] as String?,
      srcJson['url'] as String?,
      srcJson['activity'] as String?,
      srcJson['title'] as String?,
      srcJson['play_sound'] as String?,
      srcJson['play_lights'] as String?,
      srcJson['play_vibrate'] as String?,
      srcJson['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'after_open': afterOpen,
    'ticker': ticker,
    'custom': custom,
    'url': url,
    'activity': activity,
    'title': title,
    'play_sound': playSound,
    'play_lights': playLights,
    'play_vibrate': playVibrate,
    'text': text,
  };
}
