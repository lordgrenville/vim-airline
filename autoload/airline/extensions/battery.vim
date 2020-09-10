" MIT License. Copyright (c) 2014-2020 Mathias Andersson et al.
" Plugin: https://github.com/lambdalisue/battery.vim
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8
let s:spc = g:airline_symbols.space

if !exists('*battery#backend')
  finish
endif

function! airline#extensions#battery#init(ext)
  call airline#parts#define_raw('battery', '%{airline#extensions#battery#get_battery()}')
  call a:ext.add_statusline_func('airline#extensions#battery#apply')
endfunction

function! airline#extensions#battery#apply(...)
  let w:airline_section_x = get(w:, 'airline_section_c', g:airline_section_c)
  let w:airline_section_x .= '%{airline#extensions#battery#get_battery()}'
endfunction

function! airline#extensions#battery#get_battery()
  let battery = battery#component()
  return battery
endfunction

