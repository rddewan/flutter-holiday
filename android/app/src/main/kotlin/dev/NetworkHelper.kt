

import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.os.Build

object NetworkHelper {

    fun isNetworkAvailable(context: Context): Boolean {
        var result = false
        (context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager).apply { 
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                result  = isNetworkConnected(this,this.activeNetwork)
            }
            else {
                val networkInfo = this.allNetworks
                for (network in networkInfo) {
                    result = isNetworkConnected(this, network)
                }
            }
         }
         return result
    }

    private fun isNetworkConnected(cm: ConnectivityManager, network: Network?) : Boolean {
        cm.getNetworkCapabilities(network)?.also { 
            if (it.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) 
            || it.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR)) {
                return true
            }
        }    
        return false
    }

}