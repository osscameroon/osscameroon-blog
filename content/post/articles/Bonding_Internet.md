---
title: "Bonding Internet ou l'agregation de bande passante"
date: 2022-02-17T00:15:28+01:00
categories: [tutorial, blogging]
authors: [Dr.W4bl4L]
---


**Introduction**

Être un Dev dans l’environnement camerounais relève souvent d’un parcours de combattant. Entre la capacité de produire des éléments qui seront innovants dans une société presque timide en termes d’équité et de reconnaissance du talent, à cela s’ajoute le problème d’infrastructure pourtant nécessaire au développeur, quelqu’en soit son niveau ou son talent.

Nous pouvons évoquer la qualité de la bande passante Internet et la disponibilité de l’électricité, point pourtant nécessaire dans un écosystème déjà fragile comme celui du Cameroun, sin parle d’économie numérique.

Il y’a 05 opérateurs fournissant Internet au Cameroun, sans compter d’autres fournisseurs qui existent, ont des solutions plus ou moins proches des principaux qui fournissent aussi les services de voix. Il peut alors arriver que certaines zones même dans la cité capitale que politique n’aient pas une bonne couverture réseau ou n’aient pas accès à une bande passante fluide. Ceci peut être le cas pour d’autres consommateurs, hôtels, cybercafés (dont la tendance est de plus en plus faible), universités etc.

Pour un IT, développer une solution pour la structure le recrutant en utilisant des solutions open-source et un peu d’ingéniosité, revient à se définir un profil assez avantageux.

San perdre le temps, je vais vous exposer une solution que j’ai déjà déployé plusieurs fois et qui jusqu’à présent marche : L’internet Bonding.

**QU'EST-CE QUE LE BONDING INTERNET OU L'AGREGATION DE BANDE PASSANTE ?**

La liaison Internet ou l'agrégation de bande passante désigne généralement l'agrégation de plusieurs connexions Internet pour former une seule connexion solide et fiable. En général, avec l'augmentation de la demande d'Internet à haut débit, la technologie de liaison Internet devient massivement populaire de jour en jour.

Sans entrer dans un cours d’agrégation de bande passante que vous pouvez trouver sur Internet, cet article veut juste vous présenter comment l’implémenter chez vous ou en entreprise.

Sans être grotesque, l’agrégation de bande passante, c’est un peu comme prendre deux « connexions » Internet, les coupler, et « faire une sorte de bande passante plus grande ». Ceci a pour but de soit augment le débit lors de « l’upload » sur votre réseau, soit du « download », soit des deux en même temps. Voilà pourquoi, il est nécessaire de définir exactement ce que vous voulez, vu le cout onéreux des services data des FAI.

Plus pratiquement, chez les FAI assez sérieux, ils peuvent vous fournir ce type d’agrégation, mais j’ai pas encore l’info sur sa disponibilité chez nous.

Dans mes travaux, j’ai utilisé PfSense, un petit serveur (et dans certains cas, une machine virtuelle dans mon serveur où PfSense est installé et joue le même rôle que si il était installé en live), de 02 connexions suivant mes attentes développées plus haut, et d’une bonne dose de configuration et de temps. Il est aussi possible que vous utilisiez un de vos vieux PC pentium III ou dual Core, où vous installerez PfSense avec 03 cartes réseau (NIC) dont 02 serviront à récupérer le service et 01 pour la sortie (vérifiez toujours que celle-ci supportera la bande passante que vous souhaitez obtenir).

AU NIVEAU LOGIQUE, VERIFIEZ BIEN QUE LES 02 FOURNISSEURS N’AIENT PAS LA MEME ADRESSE D’INTERFACE

**COMMENT CHOISIR CES FAI ?**

Par sécurité, suivant vos attentes, vous choisirez 02 FAI suivant qu’ils soient stables et qu’en cas de panne, que l’un puisse prendre le relais (avec votre bande passante diminuée bien sûr). Vous pouvez aussi prendre les services d’un même opérateur, mais cela n’est pas judicieux.

**COMMENT CONFIGURER PFSENSE ?**

Plusieurs tutoriels existent en ligne et sont pour la plupart en anglais, mais ils démontrent clairement toutes les étapes permettant d’y arriver. Je partage quelques-uns avec vous :

[https://www.youtube.com/watch?v=ERjqcddmpcU](https://www.youtube.com/watch?v=ERjqcddmpcU)

[https://www.provya.net/?d=2017/11/24/11/31/31-](https://www.provya.net/?d=2017/11/24/11/31/31-)

[https://www.youtube.com/watch?v=tKChXh8rbPw](https://www.youtube.com/watch?v=tKChXh8rbPw)

**NE PAS CONFONDRE LOAD BALANCING ET INTERNET BONDING**

En effet, le « Load balancing » est L'équilibrage de charge qui est utilisé pour distribuer efficacement les ressources de plusieurs fournisseurs de services Internet (FSI) sur un appareil entre de nombreux clients et connexions. La liaison est utilisée pour utiliser les ressources de plusieurs FAI afin d'obtenir des vitesses plus élevées pour une seule connexion. Suivant ce dont vous aurez besoin, vous choisirez l’une des 02 pratiques et vous serez satisfait.


![if !vml]>![](https://wiki.teltonika-networks.com/wikibase/images/2/20/Networking_device_faq_lte_bonding_vs_load_balancing_load_balancing_scheme.png)


![if !vml]>![](https://wiki.teltonika-networks.com/wikibase/images/d/d6/Networking_device_faq_lte_bonding_vs_load_balancing_bonding_scheme.png)


_Crédits photos :_ [_https://wiki.teltonika-networks.com/view/LTE_Bonding_vs_Load_Balancing#:~:text=Load%20balancing%20is%20used%20to,speeds%20for%20a%20single%20connection_](https://wiki.teltonika-networks.com/view/LTE_Bonding_vs_Load_Balancing#:~:text=Load%20balancing%20is%20used%20to,speeds%20for%20a%20single%20connection)_._

Auteur :

Dr. W4b4L 

