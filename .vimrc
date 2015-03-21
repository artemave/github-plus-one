" pogo script autocompile on save
autocmd BufWritePost *.pogo silent !pogo -c % &
