package com.github.sososdk.flummkv;

import androidx.annotation.NonNull;

import com.tencent.mmkv.MMKV;

import java.util.Arrays;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlummkvPlugin
 */
public class FlummkvPlugin implements FlutterPlugin, MethodCallHandler {
  public static final String ID = "id";
  public static final String CRYPT = "crypt";
  public static final String KEY = "key";
  public static final String VALUE = "value";

  MethodChannel channel;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    MMKV.initialize(registrar.context());

    final MethodChannel channel = new MethodChannel(registrar.messenger(), "sososdk.github.com/flummkv");
    channel.setMethodCallHandler(new FlummkvPlugin());
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    MMKV.initialize(binding.getApplicationContext());

    channel = new MethodChannel(binding.getBinaryMessenger(), "sososdk.github.com/flummkv");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
    channel = null;
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    String method = call.method;
    Map<String, Object> arguments = (Map<String, Object>) call.arguments;

    String mmapID = (String) arguments.get(ID);
    String crypt = (String) arguments.get(CRYPT);
    String key = (String) arguments.get(KEY);
    Object value = arguments.get(VALUE);
    try {
      MMKV mmkv;
      if (mmapID == null) {
        mmkv = MMKV.defaultMMKV(MMKV.SINGLE_PROCESS_MODE, crypt);
      } else {
        mmkv = MMKV.mmkvWithID(mmapID, MMKV.SINGLE_PROCESS_MODE, crypt, null);
      }
      if (mmkv == null) {
        result.error("MMKVException", "MMKV is null.", null);
        return;
      }
      switch (method) {
        case "setBool":
          boolean setBoolStatus = mmkv.encode(key, (boolean) value);
          result.success(setBoolStatus);
          break;
        case "getBool":
          if (mmkv.contains(key)) {
            boolean getBoolStatus = mmkv.decodeBool(key);
            result.success(getBoolStatus);
          } else {
            result.success(null);
          }
          break;
        case "setInt":
          boolean setIntStatus;
          if (value instanceof Long) {
            setIntStatus = mmkv.encode(key, (long) value);
          } else {
            setIntStatus = mmkv.encode(key, (int) value);
          }
          result.success(setIntStatus);
          break;
        case "getInt":
          if (mmkv.contains(key)) {
            long getLongStatus = mmkv.decodeLong(key);
            result.success(getLongStatus);
          } else {
            result.success(null);
          }
          break;
        case "setDouble":
          boolean setDoubleStatus = mmkv.encode(key, (double) value);
          result.success(setDoubleStatus);
          break;
        case "getDouble":
          if (mmkv.contains(key)) {
            double getDoubleStatus = mmkv.decodeDouble(key);
            result.success(getDoubleStatus);
          } else {
            result.success(null);
          }
          break;
        case "setString":
          boolean setStringStatus = mmkv.encode(key, (String) value);
          result.success(setStringStatus);
          break;
        case "getString":
          String getStringStatus = mmkv.decodeString(key);
          result.success(getStringStatus);
          break;
        case "setBytes":
          boolean setBytesStatus = mmkv.encode(key, (byte[]) value);
          result.success(setBytesStatus);
          break;
        case "getBytes":
          byte[] getBytesStatus = mmkv.decodeBytes(key);
          result.success(getBytesStatus);
          break;
        case "contains":
          result.success(mmkv.contains(key));
          break;
        case "getValueSize":
          result.success(mmkv.getValueSize(key));
          break;
        case "removeByKey":
          mmkv.removeValueForKey(key);
          result.success(true);
          break;
        case "clear":
          mmkv.clearAll();
          result.success(true);
          break;
        case "count":
          result.success(mmkv.count());
          break;
        case "allKeys":
          String[] keys = mmkv.allKeys();
          if (keys == null) {
            result.success(null);
          } else {
            result.success(Arrays.asList(keys));
          }
          break;
        case "totalSize":
          result.success(mmkv.totalSize());
          break;
        case "pageSize":
          result.success(MMKV.pageSize());
          break;
        default:
          result.notImplemented();
          break;
      }
    } catch (Exception e) {
      result.error("Exception encountered", call.method, e);
    }
  }
}
