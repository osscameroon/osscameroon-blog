---
title: "How to create a hotspot on Linux 🐧 ?"
date: 2022-02-21T17:16:14+01:00
images: []
categories: [tutorial, network, linux]
tags: [network, linux]
authors: [pythonbrad]
---

{{<figure src="/how_to_create_a_hotspot_on_linux/hotspot.png" alt="Hotspot">}}

# Table of Contents
1. [What is a hotspot ?](#what-is-a-hotspot-)
2. [How to create it ?](#how-to-create-it-)
3. [Requirements](#requirements)
    1. [Hostapd](#hostapd)
    2. [Dhcpd](#dhcpd)
    3. [Wifi card](#a-wifi-card-with-ap-mode-support-is-needed)
4. [Implementation phase](#implementation-phase)
    1. [Installation of hostapd](#installation-of-hostapd)
    2. [Sample configuration](#80211bgn-with-wpa2-psk-and-ccmp)
    3. [We can start our AP](#we-can-start-our-ap)

## What is a hotspot ?

[From wikipedia](https://en.wikipedia.org/wiki/Hotspot_(Wi-Fi)) A hotspot is a physical location where people may obtain Internet access, typically using Wi-Fi technology, via a wireless local-area network (WLAN) using a router connected to an Internet service provider. Public hotspots may be created by a business for use by customers, such as coffee shops or hotels.

## How to create it ?

We can have many methods to create a hotspot WIFI depending of your Linux 🐧. In this tutorial, we will try to use a general method.

## Requirements

#### hostapd

hostapd is a user space daemon software enabling a network interface card to act as an Access Point (AP) and authentication server.

Capabilities of Hostapd (What it can do)
- Create an AP;
- Create multiple APs on the same card (if the card supports it, usually up to 8);

#### dhcpd

dhcpd is a DHCP server program that operates as a daemon on a server to provide Dynamic Host Configuration Protocol (DHCP) service to a network

#### A WiFi card with AP mode support is needed:
        root # iw list | grep "Supported interface modes" -A 8

                Supported interface modes:
                         * IBSS
                         * managed
                         * AP
                         * AP/VLAN
                         * WDS
                         * monitor
                         * P2P-client
                         * P2P-GO

## Installation of hostapd

We need to download and compile the hostapd source.

```sh
wget -t 3 https://w1.fi/cgit/hostap/snapshot/hostap_2_10.tar.gz
tar -xf hostap_2_10.tar.gz
cd hostap_2_10/hostapd
cp defconfig .config
make
make install
```

## Implementation phase

We need to config our hostapd.

#### Sample configuration

##### 802.11b/g/n with WPA2-PSK and CCMP

A simple but secure AP with maximal compatibility for current hardware:

######  FILE: /etc/hostapd/hostapd.conf

```ini
# the interface used by the AP
interface=wlan0
# "g" simply means 2.4GHz band
hw_mode=g
# the channel to use
channel=10
# limit the frequencies used to those allowed in the country
ieee80211d=1
# the country code
country_code=FR
# 802.11n support
ieee80211n=1
# QoS support, also required for full speed on 802.11n/ac/ax
wmm_enabled=1

# the name of the AP
ssid=somename
# 1=wpa, 2=wep, 3=both
auth_algs=1
# WPA2 only
wpa=2
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
wpa_passphrase=somepassword
```

### We can start our AP

Before it, we need to disable our wireless interface as client.

```sh
kill $pidof(wpa_supplicant)
```

An AP's interface really is just an Ethernet interface, then we need to config the AP's IP and network.

```sh
ip addr add 192.168.237.1 dev wlan0
```

We can start now our AP.

```sh
hostapd /etc/hostapd/hostapd.conf
```

## Installation of a DNS Server

```sh
wget -t 3 https://github.com/isc-projects/dhcp/archive/refs/tags/v4_4_2b1_f2.tar.gz
tar -xf v4_4_2b1_f2.tar.gz
cd dhcp-4_4_2b1_f2
./configure
make
make install
cd server/dhcpd /usr/bin
```

## Source:
- [Hostapd](https://wiki.gentoo.org/wiki/Hostapd)
