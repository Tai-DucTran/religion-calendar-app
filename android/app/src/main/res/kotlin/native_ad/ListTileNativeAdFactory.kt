package religion_calendar_app // Replace with your actual package name

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class ListTileNativeAdFactory(
    private val layoutInflater: LayoutInflater
) : GoogleMobileAdsPlugin.NativeAdFactory {

    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: MutableMap<String, Any>?
    ): NativeAdView {
        val adView = layoutInflater.inflate(R.layout.native_ad_layout, null) as NativeAdView

        // Set the headline
        adView.headlineView = adView.findViewById(R.id.ad_headline)
        (adView.headlineView as TextView).text = nativeAd.headline

        // Set the body
        adView.bodyView = adView.findViewById(R.id.ad_body)
        if (nativeAd.body != null) {
            (adView.bodyView as TextView).text = nativeAd.body
            adView.bodyView!!.visibility = View.VISIBLE
        } else {
            adView.bodyView!!.visibility = View.INVISIBLE
        }

        // Set the icon
        adView.iconView = adView.findViewById(R.id.ad_icon)
        if (nativeAd.icon != null) {
            (adView.iconView as ImageView).setImageDrawable(nativeAd.icon!!.drawable)
            adView.iconView!!.visibility = View.VISIBLE
        } else {
            adView.iconView!!.visibility = View.GONE
        }

        // Set the advertiser name
        adView.advertiserView = adView.findViewById(R.id.ad_advertiser)
        if (nativeAd.advertiser != null) {
            (adView.advertiserView as TextView).text = nativeAd.advertiser
            adView.advertiserView!!.visibility = View.VISIBLE
        } else {
            adView.advertiserView!!.visibility = View.INVISIBLE
        }

        adView.setNativeAd(nativeAd)

        return adView
    }
}