## Setup

In order to setup packages

```
elm package install
```

Since we are going to do a web app we also need:

```
elm-package install elm-lang/html
```

To compile:

``` 
elm-make test.elm
```

To generate an html to execute in the browser:

```
elm-make test.elm --output=test.html
```

To use live debugger:
```
elm-reactor
```