---
title: "Unverified, Partially and Verified Commits"
date: 2022-05-13T02:28:20+01:00
images: ['https://yokwejuste.live/_next/image?url=https%3A%2F%2Fcdn.hashnode.com%2Fres%2Fhashnode%2Fimage%2Fupload%2Fv1652414432552%2FXmbWXMR_X.png%3Fw%3D1600%26h%3D840%26fit%3Dcrop%26crop%3Dentropy%26auto%3Dcompress%2Cformat%26format%3Dwebp&w=1920&q=75']
categories: ['Opensoure']
tags: ['Github', 'VSC', 'Opensoure']
authors: ['Yokwejuste']
---
![](https://firebasestorage.googleapis.com/v0/b/doclms.appspot.com/o/veifiecommit.png?alt=media&token=2d616731-46ee-4266-8597-c7ef6cef7878)
## Introduction
GitHub is a pretty awesome platform for sharing code. One of the best **VCS**(Version control Systems) in the world. Being a distributed version control system, it enables you to share code with other developers from your local communities and across the globe. With GitHub, you can create a repository, upload files, and commit your changes.
![unverified, partially and verified commits](https://firebasestorage.googleapis.com/v0/b/doclms.appspot.com/o/githubnew.png?alt=media&token=08f3cd78-4ce0-4e2c-a142-fce73e221cbd)

With all these features, contributing to a project on GitHub and can at times include so many people in the same project and proper identification of the contributors is a must. Commits identification on GitHub is is done using a GPG signature.

## What is a GPG signature?
The **GPG**(GNU Privacy Guard) signature is a digital signature that is generated using a GPG key. GPG signatures are widely used by Linux package managers such as apt to verify the integrity of downloaded files. GPG signatures are also used by GitHub to verify the integrity of commits. As seen above on the picture above the types of commits **Partial**, **Unverified** and **Verified** commits. Let's see how to verify the commits.

## Verifying the commits
### Generating a GPG key
A commit is verified when the commit is signed by a GPG key. [GitHub Blog](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key/) explains how to generate a GPG key.
1. Go to [GPG command line tools](https://www.gnupg.org/download/) for your respective operating system and install it.
2. On your terminal, type the following command to generate a GPG key.
```
$ gpg --full-generate-key
```
3. At the prompt, specify the kind of key you want, or press `Enter` to accept the default.
4. At the prompt, specify the key size you want, or press `Enter` to accept the default. Your key must be at least **_4096_** bits.
5. Enter the length of time the key should be valid. Press `Enter` to specify the default selection, indicating that the key doesn't expire or something else depending on your preference.
6. Verify that your selections are correct.
7. Enter your user ID information i.e. GitHub username, email and token.
8. Type a secure passphrase.
9. Use the `gpg --list-secret-keys --keyid-format=long` command to list the long form of the GPG keys for which you have both a public and private key. A private key is required for signing commits or tags.
```
$ gpg --list-secret-keys --keyid-format=long
```
10. From the list of GPG keys, copy the long form of the GPG key ID you'd like to use. In this example, the GPG key ID is `3*4*6*1*5*8...`:
```
$ gpg --list-secret-keys --keyid-format=long
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot 
ssb   4096R/42B317FD4BA89E7A 2016-03-10
```
11. Copy your GPG key, beginning with `-----BEGIN PGP PUBLIC KEY BLOCK-----` and ending with `-----END PGP PUBLIC KEY BLOCK-----`.
12. Next, Add the GPG key to your GitHub account

### Adding a GPG key to your GitHub account
1. Go to your GitHub account and click on **Settings** then go to the Access section from the side navbar.
![GitHub GPG gen1](https://firebasestorage.googleapis.com/v0/b/doclms.appspot.com/o/githubgpg.png?alt=media&token=4a55e916-579d-4b54-93c8-c33745633b78)

2. After clicking on the SSH and GPG keys link, click on the **New GPG** button.
![GitHub GPG gen1](https://firebasestorage.googleapis.com/v0/b/doclms.appspot.com/o/gpggithub.png?alt=media&token=2683b39c-456e-4d62-a2fb-3ae53d4ed95c)

3. Following the **step 10** of the [Generating a GPG key](#generating-a-gpg-key)  Paste the GPG key in the text area and click on the **Save** button.

![GPG out](https://firebasestorage.googleapis.com/v0/b/doclms.appspot.com/o/gpg.png?alt=media&token=ce74e2ee-8ede-42bc-829c-24a7a50a833d)

5. To confirm the action, enter your GitHub password.

## Conclusion
With all this setting you're sure of making good and authenticate commits from both your computer and GitHub. You can now commit to your GitHub repository. Thanks for going through this tutorial.