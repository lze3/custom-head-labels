# Custom Head Labels

## Installation

* Run `git clone [url]` into a directory that is ignored (starts with `[` and ends with `]`.)
  * `git clone https://github.com/jhodgson1/custom-head-labels.git [head-labels]`
  * This is useful because it allows you to easily update with `git pull`.
* Add `start hlabels` to your server config (commonly server.cfg)
* Add the `hlabels.*` ace to your server admin's identifiers, for example:

```sh
add_ace identifier.license:2de1980f35b9fdbc19d2d5881000ab57b5097ccd "hlabels.hlrange" allow # this gives them access to the /hlrange command.
add_ace identifier.license:981nd981nd91uncu91n991jddjnjdndllcmmadee "hlabels" allow # this gives them access to all features that this script provides.
```

* For a list of available aces see the [permissions list](https://github.com/JHodgson1/custom-head-labels/tree/master#permissions-list).

## Permissions List

|Name|Feature|
|:-:|:-:|
|`hlabels`|Every feature/command this resource provides.|
|`hlabels.hlrange`|The `/hlrange` command.|

I intend on making additional aces for certain features that may exist in the future, but currently these are the only ones that exist.