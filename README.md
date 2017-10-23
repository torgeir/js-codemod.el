# js-codemod.el
Run js-codemod on current line or selected region. Works great with [helm-js-codemod.el](https://github.com/torgeir/helm-js-codemod.el)!

## Dependencies

`npm i -g jscodeshift`

## Installing

It's on [MELPA](https://melpa.org/#/getting-started), so run `M-x package-install js-codemod` to install it.

Or preferably using the ingenious [use-package](https://github.com/jwiegley/use-package) declaration

```
(use-package js-codemod
  :commands (js-codemod-mod-region))
```

## Features

`js-codemod-mod-region` runs js codemods using [jscodeshift](https://github.com/facebook/jscodeshift) on the selected region or the current line if no region is selected.

<img src="https://d3vv6lp55qjaqc.cloudfront.net/items/3S0s210n0W3O1J2H3W27/Screen%20Recording%202017-10-17%20at%2009.46%20PM.gif?X-CloudApp-Visitor-Id=5102c944a369d2eb3e4cef97298683d9&v=a5dbec11" width="80%" alt="js-codemod-el-demo"/>


## License

Copyright (C) 2017 Torgeir Thoresen

Author: @torgeir

Keywords: js codemod region

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
