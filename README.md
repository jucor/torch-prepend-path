Torch Path Prepending
======

This very simple script prepends the content of the `TORCH_PREPEND_PATH` and `TORCH_PREPEND_CPATH` environment variable to the torch search path, giving them the highest possible priority.
In particular, this allows to run concurrently different versions of a given package.

Purpose
---
By default, the `torch-env` package sets the priority by decreasing order as

1. `~/.torch`
2. the content of the `LUA_PATH` environment variable
3. the content of the global torch installation, e.g. `/usr/local/share/torch`

This package changes the order to:

1. the content of the `TORCH_PREPEND_PATH` environment variable
1. `~/.torch`
2. the content of the `LUA_PATH` environment variable
3. the content of the global torch installation, e.g. `/usr/local/share/torch`

The same holds for the C path, using `TORCH_PREPEND_CPATH` -- see [Lua's documentation](http://www.lua.org/manual/5.2/manual.html#pdf-package.cpath) for the difference between [`LUA_PATH`](http://www.lua.org/manual/5.2/manual.html#pdf-package.path) and [`LUA_CPATH`](http://www.lua.org/manual/5.2/manual.html#pdf-package.cpath).

In particular, it is now possible to run concurrently two scripts with two different versions of a package without modifying your code, by setting `TORCH_PREPEND_PATH` to different values in your shell before calling torch. For example:

```bash
TORCH_PREPEND_PATH=path_to_first_version torch  TORCH_PREPEND_CPATH=path_to_libfiles_of_first_version -l prepend-path myscript.lua &
TORCH_PREPEND_PATH=path_to_second_version  TORCH_PREPEND_CPATH=path_to_libfiles_of_first_version torch -l prepend-path myscript.lua &
```

Previously, with the default path ordering, this could only be achieved by having two versions of the script had to medling with `package.path`.

Use
---
#### Recommended 

Simply run torch from the shell with

```bash
torch -l prepend-path
```bash

And voila, the content of the environment variable `TORCH_PREPEND_PATH` is prepended at the beginning of your search path for lua files, and the content of t`TORCH_PREPEND_CPATH` to the search path for C files.


#### Alternative
If you insist on changing your code, you can add

```lua
require 'prepend-path'
``

at the beginning.

Installation
---

Either add the file `init.lua` to your torch path, or, simpler, use
``
torch-pkg deploy
``
at the root of the repository.


Torch search-order
----

