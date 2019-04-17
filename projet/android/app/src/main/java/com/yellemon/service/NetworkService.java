package com.yellemon.service;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Collections;
import java.util.List;

//The class returns the network identity of the user : ip address and mac address

/**
 * The type Network service.
 */
public class NetworkService {

    /**
     * Get device ip string.
     *
     * @return the string
     */
/*
        Author : https://stackoverflow.com/questions/6064510/how-to-get-ip-address-of-the-device-from-code/13007325
     */
    public static String getDeviceIp() {
        try {
            List<NetworkInterface> interfaces = Collections.list(NetworkInterface.getNetworkInterfaces());
            for (NetworkInterface networkInterface : interfaces) {
                List<InetAddress> addresses = Collections.list(networkInterface.getInetAddresses());
                for (InetAddress address : addresses) {
                    if (!address.isLoopbackAddress()) {
                        String formattedAddress = address.getHostAddress();

                        boolean isIPv4 = formattedAddress.indexOf(':') < 0;

                        if (isIPv4)
                            return formattedAddress;
                    }
                }
            }
        } catch (Exception ignored) {
        }

        return "";
    }

    /**
     * Gets device mac.
     *
     * @return the device mac
     */
    public static String getDeviceMAC() {
        try {
            List<NetworkInterface> all = Collections.list(NetworkInterface.getNetworkInterfaces());
            for (NetworkInterface networkInterface : all) {
                if (!networkInterface.getName().equalsIgnoreCase("wlan0")) continue;
                byte[] macBytes = networkInterface.getHardwareAddress();
                if (macBytes == null) {
                    return "";
                }


                StringBuilder res1 = new StringBuilder();
                for (byte b : macBytes) {
                    res1.append(String.format("%02X:", b));
                }

                if (res1.length() > 0) {
                    res1.deleteCharAt(res1.length() - 1);
                }
                return res1.toString();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return "";
    }
}
