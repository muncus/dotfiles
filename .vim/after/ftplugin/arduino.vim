" Customizations for Arduino file editing.

nmap <Leader>v :ArduinoVerify<CR>
nmap <Leader>f :ArduinoUpload<CR>
" user-installed boards dont show up in the list, and i'm sick of typing this.
nmap <Leader>F :let g:arduino_board="adafruit:nrf52:feather52"<CR>
set commentstring=//%s
