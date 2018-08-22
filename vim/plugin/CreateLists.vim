" from Hacking Vim 7.2 by Kim Schulz [Packt Publishing]

function! BulletList()
 let lineno = line(".")
 call setline(lineno, "   * " . getline(lineno))
endfunction

function! NumberList() range
 " set line numbers in front of lines
 let beginning=line("'<")
 let ending= line("'>")
 let difsize = ending-beginning +1
 let pre = ' '
 while (beginning <= ending)
  if match(difsize, '^9*$') == 0
    let pre = pre . ' '
  endif
  call setline(ending, pre . difsize . "\t" . getline(ending))
  let ending=ending-1
  let difsize=difsize-1
 endwhile
endfunction

