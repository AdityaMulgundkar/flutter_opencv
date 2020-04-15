package com.mulgundkar.opencv;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;

public class EmbeddingV1Activity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    OpenCV4Plugin.registerWith(registrarFor("com.mulgundkar.opencv.OpenCV4Plugin"));
  }

}