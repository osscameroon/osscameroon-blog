---
title: The fish shell is amazing
date: 2021-10-8T00:15:28+01:00
categories: [tutorial, blogging]
authors: [RMPR]
---


I&rsquo;ve been lurking the [fish shell](https://fishshell.com/) for a couple of years now (and the
[nushell](<https://github.com/nushell/nushell>) but it is another story for
another time). Not so long ago, I decided to try it, and it&rsquo;s simply... amazing. If I had to state one feature that makes me like to use it, it&rsquo;ll be the
autocompletion, hands down. It&rsquo;s the first time I just take a shell and without customization it&rsquo;s pleasing to use.


## Features

Some notable features I want to mention:

-   **The default colorscheme**: when you type something invalid it&rsquo;s red, blue when not

-   **Smart tab completion** not only for the commands but for the arguments as well, and it apparently does that by parsing man pages. The autocompletion is also
contextual, depending on where you are, it suggests different things.

-   Floating point calculation directly inside the shell, not super important, but I used to use a REPL or bc for that

-   You can configure your shell using a web interface! Just run `fish_config`


## What about Plugins?

On my previous shells I used [bash-it](<https://github.com/bash-it/bash-it/>)
and [oh-my-zsh](<https://github.com/ohmyzsh/ohmyzsh>). While those are amazing
projects, they still need configuration to get things to work really well. And 
if you want to match fish's level, you will need to install a lot of plugin and/or
write quite a few lines of code. With fish you get that for free. 
Nevertheless, there are some plugins manager,
[oh-my-fish](<https://github.com/oh-my-fish>),
[fisher](<https://github.com/jorgebucaran/fisher>) and
[Fundle](<https://github.com/danhper/fundle>). To be honest, I didn&rsquo;t
find them super useful because the only plugin I use is the
[starship](<https://github.com/starship/starship>) prompt and it&rsquo;s
available in the Fedora repo anyway. For those interested, [here is a
comparison between fisher, omf and
fundle](<https://github.com/jorgebucaran/fisher/issues/481>)
it might be a bit biased since it&rsquo;s by fisher&rsquo;s author. But those seemed to me like valid points.

[![asciicast](https://asciinema.org/a/447626.svg)](https://asciinema.org/a/447626) 

I used oh-my-zsh with powerlevel10k because it&rsquo;s very fast. When switching to fish, I felt I had to choose between
[starship](<https://github.com/starship/starship>) and [tide](<https://github.com/IlanCosman/tide>). I wish I could say more things on that, but I chose starship solely because it is on the Fedora repo :p
but it's crazy fast though.


## Some quirks (that might actually not be quirks)

The first thing you need to know, fish is **not** POSIX compliant, don&rsquo;t expect your
previous scripts to work at all. The syntax is different, and arguably better.
For example the for loop:

with fish:

```bash
for i in *.pdf
    echo $i
end
```

With bash/zsh:

```bash
for i in *.pdf;
do
    echo $i;
done
```

No more `fi`, `esac` or `done`.

Although I didn&rsquo;t face anything (`source bin/activate.fish` works like a charm),
if you have issues activating Python virtual environments, you can have a look at
[virtualfish](<https://github.com/justinmayer/virtualfish>)


## Closing thoughts

In my opinion, fish is not geared towards shell scripting, it&rsquo;s interactivity
is simply unmatched in any current shells that I know of. If you are more interested in a better shell scripting
experience, you might want to have a look at the [oil shell](<https://www.oilshell.org/>) instead.
Don&rsquo;t get me wrong, you still need to learn bash at a decent level as it is
what you&rsquo;ll probably stumble upon the most (in containers, virtual environments,
vanilla servers, &#x2026;), but this shouldn&rsquo;t prevent you from stepping up your game.
If you liked this post, check out this [awesome piece](<https://jvns.ca/blog/2017/04/23/the-fish-shell-is-awesome/>) by Julia Evans.
This is the first article of the serie about mouseless computing, I felt like it&rsquo;s kinda useful to have this as an entry point. Stay tuned for the next one.


