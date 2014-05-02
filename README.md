# An example of [ngrok](https://ngrok.com/)

The `ngrok` is ...

> Introspected tunnels to localhost
> “I want to securely expose a local web server to the internet and capture all traffic for detailed inspection and replay.”

via [ngrok.com](https://ngrok.com/)

## Requirements

* [Vagrant](http://www.vagrantup.com/) 1.4 or lator
    * [vagrant-serverspec plugin](https://github.com/jvoorhis/vagrant-serverspec)
* [VirtualBox](https://www.virtualbox.org/) 4.3.x or lator
* [Ruby](https://www.ruby-lang.org/) 1.9 or lator

## Instllations and getting started

```bash
~/tmp$ vagrant plugin install vagrant-serverspec
~/tmp$ git clone https://github.com/toooooooby/ngrok-example.git && cd ngrok-example
~/tmp/ngrok-example$ bundle install
~/tmp/ngrok-example$ vagrant up
  :
~/tmp/ngrok-example$ rake test_tunnel
vagrant ssh -c "/opt/ngrok/ngrok 80"

ngrok                                           (Ctrl+C to quit)

Tunnel Status                 online
Version                       1.6/1.5
Forwarding                    http://xxxxxx.ngrok.com -> 127.0.0.1:80
Forwarding                    https://xxxxxx.ngrok.com -> 127.0.0.1:80
Web Interface                 127.0.0.1:4040
# Conn                        0
Avg Conn Time                 0.00ms

# open https://xxxxxx.ngrok.com
(Stop to CTRL-C)
```

![](https://gist.githubusercontent.com/toooooooby/9172769/raw/d04c0d345590318f65cc8ac95aaa7f3fbb13b8f7/ngrok-preview.jpg)


