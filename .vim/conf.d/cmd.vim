command! -complete=customlist,InsertTemplateComplete -nargs=1 InsertTemplate call InsertTemplate(<f-args>)
function! InsertTemplate(file)
	try
		execute "r " . get(split(globpath(&rtp, "template/" . a:file), "\n"), -1)
	catch /E484:/
		echo "File not found."
	endtry
endfunction
function! InsertTemplateComplete(A, L, P)
	return split(get(split(globpath(&rtp, "template/" . a:A . "*"), "/"), -1, ""), "\n")
endfunction
