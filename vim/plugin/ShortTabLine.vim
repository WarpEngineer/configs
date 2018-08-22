function ShortTabLine() 
	let ret = '' 
	for i in range(tabpagenr('$')) 
		if i + 1 == tabpagenr() 
			let ret .= '%#errorMsg#' 
		else 
			let ret .= '%#TabLine#' 
		endif 
		let buflist = tabpagebuflist(i+1) 
		let winnr = tabpagewinnr(i+1) 
		let buffername = bufname(buflist[winnr - 1]) 
		let filename = fnamemodify(buffername,':t') 
		if filename == ''
			let filename = 'noname'
		endif
		if strlen(filename) >=12
			let ret .= '['.(i+1).'.'.filename[0:8].'..]'
		else
			let ret .= '['.(i+1).'.'.filename.']'
		endif 
	endfor 
	let ret .= '%#TabLineFill#%T' 
	return ret 
endfunction

