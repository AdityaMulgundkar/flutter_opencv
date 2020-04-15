package com.mulgundkar.opencv4;

import android.annotation.SuppressLint;

import com.mulgundkar.opencv4.core.CVCore;

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
    static boolean OpenCVFLag = false;

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
        if (!OpenCVFLag) {
            if (!OpenCVLoader.initDebug()) {
                System.out.println("Err");
            } else {
                OpenCVFLag = true;
            }
            // Handle initialization error
        }
        CVCore core = new CVCore();
        switch (call.method) {
            case "getPlatformVersion":
                result.success("OpenCV " + Core.VERSION);
                break;
            case "cvtColor":
                result.success(core.cvtColor((byte[]) call.argument("byteData"), (int) call.argument("outputType")));
                break;
            case "blur":
                result.success(core.blur((byte[]) call.argument("byteData"), (ArrayList) call.argument("kernelSize"), (ArrayList) call.argument("anchorPoint"), (int) call.argument("borderType")));
                break;
            case "GaussianBlur":
                result.success(core.GaussianBlur((byte[]) call.argument("byteData"), (ArrayList) call.argument("kernelSize"), (double) call.argument("sigmaX")));
                break;
            case "medianBlur":
                result.success(core.medianBlur((byte[]) call.argument("byteData"), (int) call.argument("kernelSize")));
                break;
            case "bilateralFilter":
                result.success(core.bilateralFilter((byte[]) call.argument("byteData"), (int) call.argument("diameter"), (int) call.argument("sigmaColor"), (int) call.argument("sigmaSpace"), (int) call.argument("borderType")));
                break;
            case "boxFilter":
                result.success(core.boxFilter((byte[]) call.argument("byteData"), (int) call.argument("outputDepth"), (ArrayList) call.argument("kernelSize"), (ArrayList) call.argument("anchorPoint"), (boolean) call.argument("normalize"), (int) call.argument("borderType")));
                break;
            case "sqrBoxFilter":
                result.success(core.sqrBoxFilter((byte[]) call.argument("byteData"), (int) call.argument("outputDepth"), (ArrayList) call.argument("kernelSize")));
                break;
            case "filter2D":
                result.success(core.filter2D((byte[]) call.argument("byteData"), (int) call.argument("outputDepth"), (ArrayList) call.argument("kernelSize")));
                break;
            case "dilate":
                result.success(core.dilate((byte[]) call.argument("byteData"), (ArrayList) call.argument("kernelSize")));
                break;
            case "erode":
                result.success(core.erode((byte[]) call.argument("byteData"), (ArrayList) call.argument("kernelSize")));
                break;
            case "morphologyEx":
                result.success(core.morphologyEx((byte[]) call.argument("byteData"), (int) call.argument("operation"), (ArrayList) call.argument("kernelSize")));
                break;
            case "pyrUp":
                result.success(core.pyrUp((byte[]) call.argument("byteData"), (ArrayList) call.argument("kernelSize"), (int) call.argument("borderType")));
                break;
            case "pyrDown":
                result.success(core.pyrDown((byte[]) call.argument("byteData"), (ArrayList) call.argument("kernelSize"), (int) call.argument("borderType")));
                break;
            case "pyrMeanShiftFiltering":
                result.success(core.pyrMeanShiftFiltering((byte[]) call.argument("byteData"), (double) call.argument("spatialWindowRadius"), (double) call.argument("colorWindowRadius")));
                break;
            case "threshold":
                result.success(core.threshold((byte[]) call.argument("byteData"), (double) call.argument("thresholdValue"), (double) call.argument("maxThresholdValue"), (int) call.argument("thresholdType")));
                break;
            case "adaptiveThreshold":
                result.success(core.adaptiveThreshold((byte[]) call.argument("byteData"), (double) call.argument("maxValue"), (int) call.argument("adaptiveMethod"), (int) call.argument("thresholdType"), (int) call.argument("blockSize"), (double) call.argument("constantValue")));
                break;
            case "copyMakeBorder":
                result.success(core.copyMakeBorder((byte[]) call.argument("byteData"), (int) call.argument("top"), (int) call.argument("bottom"), (int) call.argument("left"), (int) call.argument("right"), (int) call.argument("borderType")));
                break;
            case "Sobel":
                result.success(core.Sobel((byte[]) call.argument("byteData"), (int) call.argument("depth"), (int) call.argument("dx"), (int) call.argument("dy")));
                break;
            case "Scharr":
                result.success(core.Scharr((byte[]) call.argument("byteData"), (int) call.argument("depth"), (int) call.argument("dx"), (int) call.argument("dy")));
                break;
            case "Laplacian":
                result.success(core.Laplacian((byte[]) call.argument("byteData"), (int) call.argument("depth")));
                break;
            case "distanceTransform":
                result.success(core.distanceTransform((byte[]) call.argument("byteData"), (int) call.argument("distanceType"), (int) call.argument("maskSize")));
                break;
                /*
            case "warpAffine":
                result.success(core.warpAffine((byte[]) call.argument("byteData"), (int) call.argument("tranformMatrix"), (int) call.argument("size")));
                break;
                 */
            case "resize":
                result.success(core.resize((byte[]) call.argument("byteData"), (ArrayList) call.argument("outputSize"), (double) call.argument("fx"), (double) call.argument("fy"), (int) call.argument("interpolation")));
                break;
            case "applyColorMap":
                result.success(core.applyColorMap((byte[]) call.argument("byteData"), (int) call.argument("colorMap")));
                break;
            case "Canny":
                result.success(core.Canny((byte[]) call.argument("byteData"), (double) call.argument("threshold1"), (double) call.argument("threshold2")));
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    }

}
