# Itamae_WOWHoneypot

Automated installation of [WOWHoneypot](https://github.com/morihisa/WOWHoneypot) by using [Itamae](https://github.com/itamae-kitchen/itamae).

## What is Itamae?

Itamae is a simple and lightweight configuration management tool developed by Cookpad.

## What is WOWHoneypot?

WOWHoneypot is a web-based low interaction honeypot.

## How to use

```sh
# install WOWHoneypot
$ itamae ssh -h HOST -u USER cookbooks/WOWHoneypot/default.rb
# install logstash (optional)
$ itamae ssh -h HOST -u USER cookbooks/WOWHoneypot/logstash.rb
```

## TODO

- Write more detailed doc.

