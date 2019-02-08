# vim-weather
![demo](https://user-images.githubusercontent.com/29778890/51680148-4df00d80-2024-11e9-9cbe-942bda5df1de.gif)

## Usage
`:Weather [city]`

## Installation
To install using [vim-plug](https://github.com/junegunn/vim-plug):
```
Plug 'yorimoi/vim-weather'
```
`:PlugInstall`

## Requirements
[OpenWeatherMap](https://openweathermap.org/appid) API key.  
Vim version 8.0 or higher.  
And you need the \`[curl](https://curl.haxx.se/)\` or \`[wget](https://www.gnu.org/software/wget/)\` command.

## Settings
```
let g:weather#appid = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
let g:weather#area = 'Tokyo'
let g:weather#unit = 'metric'(°C) or 'imperial'(°F)
```

## License
MIT
