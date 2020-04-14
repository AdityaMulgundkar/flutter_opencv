package com.mulgundkar.opencv4;

import android.annotation.SuppressLint;

import com.mulgundkar.opencv4.core.OpenCVCore;

import org.opencv.android.OpenCVLoader;
import org.opencv.core.Core;
import org.opencv.core.CvType;
import org.opencv.core.Mat;
import org.opencv.core.Point;
import org.opencv.core.Size;
import org.opencv.core.MatOfByte;
import org.opencv.core.MatOfInt;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;

import java.util.ArrayList;

import androidx.annotation.NonNull;
import io.flutter.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * Opencv4Plugin
 */
public class Opencv4Plugin implements FlutterPlugin, MethodCallHandler {

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        final MethodChannel channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "opencv4");
        channel.setMethodCallHandler(new Opencv4Plugin());
    }

    // This static function is optional and equivalent to onAttachedToEngine. It supports the old
    // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
    // plugin registration via this function while apps migrate to use the new Android APIs
    // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
    //
    // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
    // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
    // depending on the user's project. onAttachedToEngine or registerWith must both be defined
    // in the same class.
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "opencv4");
        channel.setMethodCallHandler(new Opencv4Plugin());
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (!OpenCVLoader.initDebug()) {
            // Handle initialization error
            System.out.println("Err");
        }
        switch (call.method) {
            case "getPlatformVersion":
                result.success("OpenCV " + Core.VERSION);
                break;
            case "threshold":
                result.success(threshold((byte[]) call.argument("byteData"), (double) call.argument("thresholdValue"), (double) call.argument("maxThresholdValue"), (int) call.argument("thresholdType")));
                break;
            case "blur":
                OpenCVCore core = new OpenCVCore();
                result.success(core.blur((byte[]) call.argument("byteData"), (ArrayList) call.argument("kernelSize"), (ArrayList) call.argument("anchorPoint"), (int) call.argument("borderType")));
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    }

    @SuppressLint("MissingPermission")
    private byte[] threshold(byte[] byteData, double thresholdValue, double maxThresholdValue, int thresholdType) {
            Mat srcGray = new Mat();
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);
            //Mat src = Imgcodecs.imread(filePath);
            // Convert the image to Gray
            Imgproc.cvtColor(src, srcGray, Imgproc.COLOR_BGR2GRAY);
            Imgproc.threshold(srcGray, dst, thresholdValue, maxThresholdValue, thresholdType);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byte[] byteArray = matOfByte.toArray();
            return byteArray;
    }

}
