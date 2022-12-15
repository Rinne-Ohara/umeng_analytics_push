/// Wrap Message for Android&iOS
class MessageModel {
  String? displayType;
  Map<String, dynamic>? extra;//
  MessageBodyModel? body;//android专用
  String? msgId;
  String? source;//来源 0是前台推送 1是后台推送 目前ios专用
  MessageApsModel? aps;//ios专用

  MessageModel(this.displayType, this.extra, this.body, this.msgId, this.source, this.aps);

  factory MessageModel.fromJson(Map<String, dynamic> srcJson) {
    return MessageModel(
      srcJson['display_type'] as String?,
      srcJson['extra'] as Map<String, dynamic>?,
      srcJson['body'] == null ? null : MessageBodyModel.fromJson(srcJson['body'] as Map<String, dynamic>),
      srcJson['msg_id'] as String?,
      srcJson['source'] as String?,
      srcJson['aps'] == null ? null : MessageApsModel.fromJson(srcJson['aps'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'display_type': displayType,
        'extra': extra,
        'body': body?.toJson(),
        'msg_id': msgId,
        'source': source,
        'aps': aps?.toJson(),
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

class MessageApsModel {
  MessageApsAlertModel? alert;

  MessageApsModel(this.alert);

  factory MessageApsModel.fromJson(Map<String, dynamic> srcJson) {
    return MessageApsModel(
      srcJson['alert'] == null ? null : MessageApsAlertModel.fromJson(srcJson['alert'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'alert': alert?.toJson(),
      };
}

class MessageApsAlertModel {
  String? title;
  String? body;

  MessageApsAlertModel(this.title, this.body);

  factory MessageApsAlertModel.fromJson(Map<String, dynamic> srcJson) {
    return MessageApsAlertModel(
      srcJson['title'] as String?,
      srcJson['body'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
      };
}
