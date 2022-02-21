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
    1. [Simple configuration](#80211bgn-with-wpa2-psk-and-ccmp)
    2. [Trible AP](#80211bgn-triple-ap)

## What is a hotspot ?

[From wikipedia](https://en.wikipedia.org/wiki/Hotspot_(Wi-Fi)) A hotspot is a physical location where people may obtain Internet access, typically using Wi-Fi technology, via a wireless local-area network (WLAN) using a router connected to an Internet service provider. Public hotspots may be created by a business for use by customers, such as coffee shops or hotels.

## How to create it ?

We can have many methods to create a hotspot WIFI depending of your Linux 🐧. In this tutorial, we will try to use a general method.

## Requirements

#### hostapd

hostapd is a user space daemon software enabling a network interface card to act as an access point and authentication server.

Capabilities of Hostapd (What it can do)
- Create an AP;
- Create multiple APs on the same card (if the card supports it, usually up to 8);

#### dhcpd

dhcpd is a DHCP server program that operates as a daemon on a server to provide Dynamic Host Configuration Protocol service to a network

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

## Implementation phase

We need to config our hostapd.

Before it, we need to disable our wireless interface as client.

#### Sample network configuration for an AP

An AP's interface really is just an Ethernet interface:

###### FILE: /etc/conf.d/net

```ini
(...)
modules_wlan0="!iwconfig !wpa_supplicant !iw" # by default wireless interfaces are assumed to be clients, not APs
config_wlan0="192.168.42.1/24"            # the AP's IP and network
```

#### Sample configurations

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

##### 802.11b/g/n triple AP

Three APs on the same card, one with WPA2, one with WPA1, one without encryption.

Hostapd automatically creates new interfaces for the extra APs:

###### FILE: /etc/hostapd/hostapd.conf

```ini
interface=wlan0
hw_mode=g
channel=10
ieee80211d=1
country_code=FR
ieee80211n=1
wmm_enabled=1

# First AP
ssid=test1
auth_algs=1
wpa=2
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
wpa_passphrase=somepassword

# Second AP
# the name of the new interface hostapd will create to handle this AP 
bss=wlan1
ssid=test2
auth_algs=1
wpa=1
wpa_key_mgmt=WPA-PSK
wpa_passphrase=someotherpassword

# Third AP
# the name of the new interface hostapd will create to handle this AP 
bss=wlan2
ssid=test3
# since there is no encryption defined, none will be used
```

## Source:
- [Hostapd](https://wiki.gentoo.org/wiki/Hostapd)