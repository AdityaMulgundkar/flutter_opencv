package com.mulgundkar.opencv4.core;

import android.annotation.SuppressLint;

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
import java.util.List;

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
public class CVCore {

    public byte[] cvtColor(byte[] byteData, int outputType) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // Convert the image color
            Imgproc.cvtColor(src, dst, outputType);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] blur(byte[] byteData, ArrayList kernelSize, ArrayList anchorPoint, int borderType) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            Size size = new Size((double) kernelSize.get(0), (double) kernelSize.get(1));
            Point point = new Point((double) anchorPoint.get(0), (double) anchorPoint.get(1));
            // Convert the image to Gray
            Imgproc.blur(src, dst, size, point, borderType);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] GaussianBlur(byte[] byteData, ArrayList kernelSize, double sigmaX) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            Size size = new Size((double) kernelSize.get(0), (double) kernelSize.get(1));
            // Convert the image to Gray
            Imgproc.GaussianBlur(src, dst, size, sigmaX);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] medianBlur(byte[] byteData, int kernelSize) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // Convert the image to Gray
            Imgproc.medianBlur(src, dst, kernelSize);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] bilateralFilter(byte[] byteData, int diameter, int sigmaColor, int sigmaSpace, int borderType) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // Convert the image to Gray
            Imgproc.bilateralFilter(src, dst, diameter, sigmaColor, sigmaSpace, borderType);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] boxFilter(byte[] byteData, int outputDepth, ArrayList kernelSize, ArrayList anchorPoint, boolean normalize, int borderType) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            Size size = new Size((double) kernelSize.get(0), (double) kernelSize.get(1));
            Point point = new Point((double) anchorPoint.get(0), (double) anchorPoint.get(1));

            // Convert the image to Gray
            Imgproc.boxFilter(src, dst, outputDepth, size, point, normalize, borderType);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] sqrBoxFilter(byte[] byteData, int outputDepth, ArrayList kernelSize) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            Size size = new Size((double) kernelSize.get(0), (double) kernelSize.get(1));

            // Convert the image to Gray
            Imgproc.sqrBoxFilter(src, dst, outputDepth, size);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] filter2D(byte[] byteData, int outputDepth, ArrayList kernelSize) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // Creating kernel matrix
            Mat kernel = Mat.ones((int) kernelSize.get(0), (int) kernelSize.get(1), CvType.CV_32F);

            for(int i = 0; i<kernel.rows(); i++) {
                for(int j = 0; j<kernel.cols(); j++) {
                    double[] m = kernel.get(i, j);

                    for(int k = 1; k<m.length; k++) {
                        m[k] = m[k]/(2 * 2);
                    }
                    kernel.put(i,j, m);
                }
            }
            // Convert the image to Gray
            Imgproc.filter2D(src, dst, outputDepth, kernel);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] dilate(byte[] byteData, ArrayList kernelSize) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // Preparing the kernel matrix object
            Mat kernel = Imgproc.getStructuringElement(Imgproc.MORPH_RECT,
                    new  Size(((int) kernelSize.get(0)*(int) kernelSize.get(1)) + 1, ((int) kernelSize.get(0)*(int) kernelSize.get(1))+1));

            // Convert the image to Gray
            Imgproc.dilate(src, dst, kernel);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] erode(byte[] byteData, ArrayList kernelSize) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // Preparing the kernel matrix object
            Mat kernel = Imgproc.getStructuringElement(Imgproc.MORPH_RECT,
                    new  Size(((int) kernelSize.get(0)*(int) kernelSize.get(1)) + 1, ((int) kernelSize.get(0)*(int) kernelSize.get(1))+1));

            // Convert the image to Gray
            Imgproc.erode(src, dst, kernel);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] morphologyEx(byte[] byteData, int operation, ArrayList kernelSize) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // Creating kernel matrix
            Mat kernel = Mat.ones((int) kernelSize.get(0),(int) kernelSize.get(0), CvType.CV_32F);

            // Morphological operation
            Imgproc.morphologyEx(src, dst, operation, kernel);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] pyrUp(byte[] byteData, ArrayList kernelSize, int borderType) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // Size of the new image
            Size size = new Size((double) kernelSize.get(0), (double) kernelSize.get(1));

            // pyrUp operation
            Imgproc.pyrUp(src, dst, size, borderType);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] pyrDown(byte[] byteData, ArrayList kernelSize, int borderType) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // Size of the new image
            Size size = new Size((double) kernelSize.get(0), (double) kernelSize.get(1));

            // pyrDown operation
            Imgproc.pyrDown(src, dst, size, borderType);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] pyrMeanShiftFiltering(byte[] byteData, double spatialWindowRadius, double colorWindowRadius) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // pyrMeanShiftFiltering operation
            Imgproc.pyrMeanShiftFiltering(src, dst, spatialWindowRadius, colorWindowRadius);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] threshold(byte[] byteData, double thresholdValue, double maxThresholdValue, int thresholdType) {
        byte[] byteArray = new byte[0];
        try {
            Mat srcGray = new Mat();
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);
            // Convert the image to Gray
            Imgproc.cvtColor(src, srcGray, Imgproc.COLOR_BGR2GRAY);

            // Thresholding
            Imgproc.threshold(srcGray, dst, thresholdValue, maxThresholdValue, thresholdType);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] adaptiveThreshold(byte[] byteData, double maxValue, int adaptiveMethod, int thresholdType, int blockSize, double constantValue) {
        byte[] byteArray = new byte[0];
        try {
            Mat srcGray = new Mat();
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // Adaptive Thresholding
            Imgproc.adaptiveThreshold(srcGray, dst, maxValue, adaptiveMethod, thresholdType, blockSize, constantValue);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] copyMakeBorder(byte[] byteData, int top, int bottom, int left, int right, int borderType) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // copyMakeBorder operation
            Core.copyMakeBorder(src, dst, top, bottom, left, right, borderType);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] Sobel(byte[] byteData, int depth, int dx, int dy) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // Sobel operation
            Imgproc.Sobel(src, dst, depth, dx, dy);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] Scharr(byte[] byteData, int depth, int dx, int dy) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // Scharr operation
            Imgproc.Scharr(src, dst, depth, dx, dy);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] Laplacian(byte[] byteData, int depth) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // Laplacian operation
            Imgproc.Laplacian(src, dst, depth);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] distanceTransform(byte[] byteData, int distanceType, int maskSize) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // distanceTransform operation
            Imgproc.distanceTransform(src, dst, distanceType, maskSize);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] resize(byte[] byteData, ArrayList outputSize, double fx, double fy, int interpolation) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // Size of the new image
            Size size = new Size((double) outputSize.get(0), (double) outputSize.get(1));

            // resize operation
            Imgproc.resize(src, dst, size, fx, fy, interpolation);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] applyColorMap(byte[] byteData, int colorMap) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // resize operation
            Imgproc.applyColorMap(src, dst, colorMap);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }

    @SuppressLint("MissingPermission")
    public byte[] Canny(byte[] byteData, double threshold1, double threshold2) {
        byte[] byteArray = new byte[0];
        try {
            Mat dst = new Mat();
            // Decode image from input byte array
            Mat src = Imgcodecs.imdecode(new MatOfByte(byteData), Imgcodecs.IMREAD_UNCHANGED);

            // resize operation
            Imgproc.Canny(src, dst, threshold1, threshold2);

            //instantiating an empty MatOfByte class
            MatOfByte matOfByte = new MatOfByte();
            //Converting the Mat object to MatOfByte
            Imgcodecs.imencode(".jpg", dst, matOfByte);
            byteArray = matOfByte.toArray();
        } catch (Exception e) {
            System.out.println("OpenCV Error: " + e.toString());
        }
        return byteArray;
    }
}
