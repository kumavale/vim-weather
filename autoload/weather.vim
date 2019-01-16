scriptencoding utf-8

let s:status = get(g:, 'weather#status_map', {
\ "01d": "sky is clear",
\ "02d": "few clouds",
\ "03d": "scattered clouds",
\ "04d": "broken clouds",
\ "09d": "shower rain",
\ "10d": "Rain",
\ "11d": "Thunderstorm",
\ "13d": "snow",
\ "50d": "mist",
\})

let g:weather#area = get(g:, 'weather#area', 'Yokohama-shi')
let g:weather#unit = get(g:, 'weather#unit', 'metric')

" .vimrc Example
" let g:weather#appid = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
" let g:weather#area = 'Tokyo'
" let g:weather#unit = 'imperial'

command! -nargs=? Weather call Weather(<f-args>)
function! Weather(...) abort
  if a:0 == 1
    let g:weather#area = a:1
  end
  if !exists('g:weather#appid')
    throw 'require `appid`'
  endif
  let s:url = printf('http://api.openweathermap.org/data/2.5/weather?units=%s&q=%s&appid=%s', g:weather#unit, g:weather#area, g:weather#appid)
  if executable('curl')
    let command = printf('curl -fsS "%s"', s:url)
  elseif executable('wget')
    let command = printf('wget --no-check-certificate --method=GET -O - "%s"', s:url)
  else
    throw 'require `curl` or `wget` command'
  endif
  let res = system(command)
  let json = json_decode(res)
  let area = json["name"]
  let status = json["weather"][0]["icon"][:2]
  let degree = json["main"]["temp"]
  echon printf("[%s] %s, %s%s", area, has_key(s:status, status) ? s:status[status]: '?', degree, g:weather#unit == "metric" ? "℃" : "℉")
endfunction
