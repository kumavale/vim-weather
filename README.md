# vim-weather
![image](https://user-images.githubusercontent.com/29778890/51436048-aba0f480-1cc8-11e9-8e8e-8bf2b0cc58a3.png)

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
let g:weather#unit = 'metric'(℃) or 'imperial'(℉)
```

## License
Public Domain
