---
title: "How to create a hotspot on Linux 🐧?"
date: 2022-02-21T17:16:14+01:00
images: []
categories: [tutorial, network, linux]
tags: [network, linux]
authors: [pythonbrad]
---

{{<figure src="/how_to_create_a_hotspot_on_linux/hotspot.png" alt="Hotspot">}}

## Table of Contents
1. [What is a hotspot?](#what-is-a-hotspot)
2. [How to create it?](#how-to-create-it)
3. [Requirements](#requirements)
4. [Installation of hostapd](#installation-of-hostapd)
5. [Installation of a DHCP Server](#installation-of-a-dhcp-server)
6. [Source](#source)

## What is a hotspot?

[From wikipedia](https://en.wikipedia.org/wiki/Hotspot_(Wi-Fi)) A hotspot is a physical location where people may obtain Internet access, typically using Wi-Fi technology, via a wireless local-area network (WLAN) using a router connected to an Internet service provider. Public hotspots may be created by a business for use by customers, such as coffee shops or hotels.

## How to create it?

We can have many methods to create a hotspot WIFI depending of Linux 🐧 used. In this tutorial, we will try to use a general method.

## Requirements

#### hostapd

hostapd is a user space daemon software enabling a network interface card to act as an Access Point (AP) and authentication server.

Capabilities of Hostapd (What it can do)
- Create an AP;
- Create multiple APs on the same card (if the card supports it, usually up to 8);

#### dhcpd

dhcpd is a DHCP server program that operates as a daemon on a server to provide Dynamic Host Configuration Protocol (DHCP) service to a network

#### A WiFi card with AP mode support is needed:

To verify it, run the command below.

```sh
iw list | grep "Supported interface modes" -A 8
```

We will have an output like:

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

### Sample configuration
We need to config our hostapd.

#### 802.11b/g/n with WPA2-PSK and CCMP

A simple but secure AP with maximal compatibility for current hardware:

#####  FILE: /etc/hostapd/hostapd.conf
We need to identify our wireless interface.

```sh
iw dev | grep "Interface"
```

In this example, we will use wlan0 as our wireless interface.
But you should replace it by your own.

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
We suppose that you will use wpa_supplicant.

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

At this point, our AP is functional. But the client should config his IP address manually to communicate in the network.

## Installation of a DHCP Server

A DHCP server will permit to assign automatically an IP address to each client of our network.

We will download and compile the dhcpd source.

```sh
wget -t 3 https://github.com/isc-projects/dhcp/archive/refs/tags/v4_4_2b1_f2.tar.gz
tar -xf v4_4_2b1_f2.tar.gz
cd dhcp-4_4_2b1_f2
./configure --prefix /usr
make
make install
```

### Sample configuration
We need to config our dhcpd.

####  FILE: /etc/dhcpd/dhcpd.conf

```ini
# -------------------------
# dhcpd.conf
#
# Sample configuration file for ISC dhcpd
#

# option definitions common to all supported networks...
option domain-name "example.org";
# option domain-name-servers ns1.example.org, ns2.example.org;

default-lease-time 1800;
max-lease-time 7200;

# We're going to be authoritative for the network we've
# just created.

authoritative;

# No service will be given on this subnet, but we're telling
# the DHCP server about it so it understands it's there and
# not to hand out leases for it.

# subnet 10.14.8.195 netmask 255.255.255.0 {
# }

# But we do want to hand out leases for the 192.168.1.0/24
# network for purposes of this test..

subnet 192.168.237.0 netmask 255.255.255.0 {
    range 192.168.237.100 192.168.237.150;
    option routers 192.168.237.1;
}
# -------------------------
```

### We can start our DHCP server

```sh
dhcpd -f -cf /etc/hostapd/hostapd.conf
```

Now, if we try to connect a client to our AP, this client will receive automatically an IP address.

## Source:
- [Hostapd](https://wiki.gentoo.org/wiki/Hostapd)
