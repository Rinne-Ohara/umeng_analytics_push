package io.github.zileyuan.umeng_analytics_push;

import android.app.Application;
import android.app.Activity;
import android.util.Log;
import android.content.Context;
import android.content.Intent;
import com.umeng.commonsdk.UMConfigure;
import com.umeng.message.IUmengRegisterCallback;
import com.umeng.analytics.MobclickAgent;
import com.umeng.message.PushAgent;
import com.umeng.message.MsgConstant;
import com.umeng.message.UmengNotificationClickHandler;
import com.umeng.message.entity.UMessage;

import org.android.agoo.huawei.HuaWeiRegister;
import org.android.agoo.mezu.MeizuRegister;
import org.android.agoo.oppo.OppoRegister;
import org.android.agoo.vivo.VivoRegister;
import org.android.agoo.honor.HonorRegister;

public class UmengAnalyticsPushFlutterAndroid {

    public static PushAgent UmengPushAgent;
    public static Context context;
    public static String appkey;
    public static String channel;
    public static String messageSecret;

    public static void androidPreInit(Context context, String appkey, String channel, String messageSecret) {
        // SDK预初始化函数不会采集设备信息，也不会向友盟后台上报数据。
        // preInit预初始化函数耗时极少，不会影响App首次冷启动用户体验
        UmengAnalyticsPushFlutterAndroid.context = context;
        UmengAnalyticsPushFlutterAndroid.appkey = appkey;
        UmengAnalyticsPushFlutterAndroid.channel = channel;
        UmengAnalyticsPushFlutterAndroid.messageSecret = messageSecret;
        UMConfigure.preInit(context, appkey, channel);
    }

    public static void androidInit(boolean logEnabled, boolean pushEnabled) {
        Context context = UmengAnalyticsPushFlutterAndroid.context;
        String appkey = UmengAnalyticsPushFlutterAndroid.appkey;
        String channel = UmengAnalyticsPushFlutterAndroid.channel;
        String messageSecret = UmengAnalyticsPushFlutterAndroid.messageSecret;
        UMConfigure.setLogEnabled(logEnabled);
        UMConfigure.init(context, appkey, channel, UMConfigure.DEVICE_TYPE_PHONE, messageSecret);
        if (pushEnabled && messageSecret != null && !messageSecret.isEmpty()) {
            //获取消息推送代理示例
            PushAgent mPushAgent = PushAgent.getInstance(context);
            mPushAgent.setResourcePackageName(BuildConfig.LIBRARY_PACKAGE_NAME);
            //设置客户端允许声音提醒
            mPushAgent.setNotificationPlaySound(MsgConstant.NOTIFICATION_PLAY_SDK_ENABLE);
            //设置客户端允许呼吸灯点亮
            mPushAgent.setNotificationPlayLights(MsgConstant.NOTIFICATION_PLAY_SDK_ENABLE);
            //设置客户端允许震动
            mPushAgent.setNotificationPlayVibrate(MsgConstant.NOTIFICATION_PLAY_SDK_ENABLE);
            //设置冷却时间，避免三分钟内出现多条通知而被替换
            mPushAgent.setMuteDurationSeconds(180);
            //注册推送服务，每次调用register方法都会回调该接口
            mPushAgent.register(new IUmengRegisterCallback() {
                @Override
                public void onSuccess(String deviceToken) {
                    //注册成功会返回deviceToken deviceToken是推送消息的唯一标志
                    Log.i("umeng_push_register", "注册成功：deviceToken：-------->  " + deviceToken);

                }
                @Override
                public void onFailure(String s, String s1) {
                    Log.e("umeng_push_register", "注册失败：-------->  " + "s:" + s + ",s1:" + s1);
                }
            });
            UmengNotificationClickHandler notificationClickHandler = new UmengNotificationClickHandler() {
                @Override
                public void handleMessage(Context context, UMessage msg) {
                    super.handleMessage(context, msg);
//                    rouseMainActivity(context);
                    UmengAnalyticsPushPlugin.eventSink.success(msg.getRaw().toString());
                }
//                    @Override
//                    public void dealWithCustomAction(Context context, UMessage msg) {
//                        Log.i("dealWithCustomAction --------->  ", msg.custom);
//                        this.launchApp(var1, var2);
//                        rouseMainActivity(context);
////                        UmengAnalyticsPushPlugin.eventSink.success(msg.getRaw().toString());
//                    }
            };
            mPushAgent.setNotificationClickHandler(notificationClickHandler);
            //后台进行日活统计及多维度推送的必调用方法，请务必调用
            mPushAgent.onAppStart();
            UmengAnalyticsPushFlutterAndroid.UmengPushAgent = mPushAgent;
        }
        //选择AUTO自动采集模式（必须！）
        MobclickAgent.setPageCollectionMode(MobclickAgent.PageMode.AUTO);
    }

    public static void androidOnResume(Context context) {
        MobclickAgent.onResume(context);
    }

    public static void androidOnPause(Context context) {
        MobclickAgent.onPause(context);
    }

    public static void registerXiaomi(Context context, String appId, String appKey) {
        MiPushRegistar.register(context, appId, appKey);
    }

    public static void registerHuawei(Application application) {
        HuaWeiRegister.register(application);
    }

    public static void registerOppo(Context context, String appKey, String appSecret) {
        OppoRegister.register(context, appKey, appSecret);
    }

    public static void registerVivo(Context context) {
        VivoRegister.register(context);
    }

    public static void registerMeizu(Context context, String appId, String appKey) {
        MeizuRegister.register(context, appId, appKey);
    }

    public static void registerHonor(Context context) {
        HonorRegister.register(context);
    }

    public static void rouseMainActivity(Context context) {
        Intent intent = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
        context.startActivity(intent);
    }
}