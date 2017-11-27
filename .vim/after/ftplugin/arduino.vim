" Customizations for Arduino file editing.

" makeprg is set by default to verify. using :make means we get error messages
" in the quickfix window, where :ArduinoVerify does not.
nmap <Leader>v :make<CR>
nmap <Leader>f :ArduinoUpload<CR>
" user-installed boards dont show up in the list, and i'm sick of typing this.
" Calling the method updates makeprg, so it builds for the correct board.
nmap <Leader>F :ArduinoChooseBoard adafruit:nrf52:feather52<CR>
set commentstring=//%s
