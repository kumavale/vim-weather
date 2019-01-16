scriptencoding utf-8

let g:weather#area = get(g:, 'weather#area', 'Tokyo')
let g:weather#unit = get(g:, 'weather#unit', 'metric')

function! weather#main(...) abort
  if a:0 == 1
    let g:weather#area = a:1
  end
  if !exists('g:weather#appid')
    echoerr 'set "appid"'
  endif
  let s:url = printf("http://api.openweathermap.org/data/2.5/weather?units=%s&q=%s&appid=%s", g:weather#unit, g:weather#area, g:weather#appid)
  if executable('curl')
    let command = printf('curl -fsS "%s"', s:url)
  elseif executable('wget')
    let command = printf('wget --no-check-certificate --method=GET -O- -q "%s"', s:url)
  else
    echoerr 'require `curl` or `wget` command'
  endif
  let res = system(command)
  try
    let json = json_decode(res)
    let area = json["name"]
    let status = json["weather"][0]["description"]
    let temp = json["main"]["temp"]
  catch
    echoerr "invalid request"
  endtry
  echon printf("[%s] %s, %s%s", area, status, temp, g:weather#unit == "metric" ? "℃" : "℉")
endfunction
