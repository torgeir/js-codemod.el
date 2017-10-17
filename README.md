# js-codemod.el
Run js-codemod on current line or selected region.

## Installing


It's soon™ on [MELPA](https://melpa.org/#/getting-started), so any minute now you can run `M-x package-install js-codemod` to install it.

Or preferably using the ingenious [use-package](https://github.com/jwiegley/use-package) declaration

```
(use-package js-codemod
  :commands (js-codemod/mod-region))
```

## Features

`js-codemod/mod-region` runs js codemods using [jscodeshift](https://github.com/facebook/jscodeshift) on the selected region or the current line if no region is selected.

<img src="https://d3vv6lp55qjaqc.cloudfront.net/items/3S0s210n0W3O1J2H3W27/Screen%20Recording%202017-10-17%20at%2009.46%20PM.gif?X-CloudApp-Visitor-Id=5102c944a369d2eb3e4cef97298683d9&v=a5dbec11" width="80%" alt="js-codemod-el-demo"/>
