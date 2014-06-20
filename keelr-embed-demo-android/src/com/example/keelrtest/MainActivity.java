package com.example.keelrtest;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.webkit.WebView;
import android.widget.Toast;

public class MainActivity extends Activity {

    String uri_scheme = "demoapp";
    String redirect_uri = uri_scheme + "://";
    String client_id = "";
    String site_name = "demo";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		WebView w = (WebView)findViewById(R.id.webView1);
		w.getSettings().setJavaScriptEnabled(true);
		w.getSettings().setSupportZoom(false);
		w.getSettings().setUseWideViewPort(true);
		// w.setBackgroundColor(Color.BLACK);

		String fragment = "";
		Intent i = getIntent();
		if (i.getAction() == Intent.ACTION_VIEW &&
			i.getScheme().equals(uri_scheme)) {
	        Uri uri = getIntent().getData();
	        fragment = uri.getFragment();
	    }

		String url = String.format("https://embed.keelr.com/v2/%s?client_id=%s&response_type=token&redirect_uri=%s#%s", site_name, client_id, redirect_uri, fragment);
		w.loadUrl(url);
	}
}
